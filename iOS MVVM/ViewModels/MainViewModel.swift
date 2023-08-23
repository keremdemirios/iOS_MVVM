//
//  File.swift
//  iOS MVVM
//
//  Created by Kerem Demir on 30.07.2023.
//

import UIKit

class MainViewModel {
    
    func numbersOfSection() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        10
    }
    
    func getData(){
        APICaller.getTrendingMovies { result in
            switch result {
            case .success(let data):
                print("Top Trending Counts : \(data.results.count)")
//                print("1: \(data.totalResults)")
//                print(data.results.first!)
            case .failure(let error):
                print("Error at get data : \(error.localizedDescription)")
            }
        }
    }
    
}
