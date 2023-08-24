// TO DO : 4. veya 3. videoda kaldin.
//  File.swift
//  iOS MVVM
//
//  Created by Kerem Demir on 30.07.2023.
//

import UIKit

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var dataSource: TrendingMovieModel?
    
    func numbersOfSection() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        10
    }
    
    func getData(){
        if isLoading.value ?? true {
            return
        }
        
        isLoading.value = true
        
        APICaller.getTrendingMovies { [weak self] result in
            self?.isLoading.value = false
            
            switch result {
            case .success(let data):
                print("Top Trending Counts : \(data.results.count)")
                self?.dataSource = data
            case .failure(let error):
                print("Error at get data : \(error.localizedDescription)")
            }
        }
    }
    
}
