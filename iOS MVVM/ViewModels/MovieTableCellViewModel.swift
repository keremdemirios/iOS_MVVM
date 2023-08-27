//
//  MovieTableCellViewModel.swift
//  iOS MVVM
//
//  Created by Kerem Demir on 27.08.2023.
//

import Foundation

class MovieTableCellViewModel {
    
    var id: Int
    var title: String
    var date: String
    var rating: String
    var imageUrl: URL?
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title ?? movie.name ?? "Empty"
        self.date = movie.releaseDate ?? movie.firstAirDate ?? "Empty"
        self.rating = "\(String(format: "%.1f", movie.voteAverage))/10"
        self.imageUrl = makeImageURL(movie.posterPath ?? "Problem") // Example ->    /8173128371823.jpg
        
        print("Image Server Adress : \(NetworkConstant.shared.imageServerAdress)")
        print("Poster Path : \(movie.posterPath)")
    }
    
    func makeImageURL( _ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAdress)\(imageCode)")
    }
}
