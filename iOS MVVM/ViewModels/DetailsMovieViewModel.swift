//
//  DetailsMovieViewModel.swift
//  iOS MVVM
//
//  Created by Kerem Demir on 27.08.2023.
//

import Foundation

class DetailsMovieViewModel {
    
    var movie: Movie
    
    var movieImage: URL?
    var movieTite: String
    var movieDescription: String
    var movieID:Int
    
    init(movie: Movie) {
        self.movie = movie
        
        self.movieID = movie.id
        self.movieTite = movie.title ?? movie.name ?? "Empty Name"
        self.movieDescription = movie.overview
        self.movieImage = makeImageURL(movie.backdropPath)
        
    }
    
    func makeImageURL( _ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAdress)\(imageCode)")
    }
}
