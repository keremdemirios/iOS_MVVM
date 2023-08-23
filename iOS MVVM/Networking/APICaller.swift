//
//  APICaller.swift
//  iOS MVVM
//
//  Created by Kerem Demir on 30.07.2023.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
    static func getTrendingMovies(completionHandler: @escaping (_ result: Result<TrendingMovieModel,NetworkError>) -> Void ) {
        // API çağrısını yap ve sonucu completionHandler içinde döndür.
        let urlString =
        NetworkConstant.shared.serverAdress
        +
        "trending/all/day?api_key="
        +
        NetworkConstant.shared.apiKey
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        // URL'de Sorun Yoksa
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil,
               let data = data,
               let resultData = try? JSONDecoder().decode(TrendingMovieModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}

