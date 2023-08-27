//
//  NetworkConstant.swift
//  iOS MVVM
//
//  Created by Kerem Demir on 30.07.2023.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        // Singleton
    }
    
    public var apiKey: String {
        get {
            // API KEY from https://www.themoviedb.org/settings/api
            return "9d4e2bb4b5c9913f7dfecec00f852fc2"
        }
    }
    
    public var serverAdress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAdress: String {
        get {
            return "https://api.themoviedb.org/3/movie/movie_id/images"
        }
    }
}
