//
//  APIHelper.swift
//  MovieDBRxViper
//
//  Created by Gregorius Albert on 30/01/23.
//

import Foundation
import Network

class APIManager {
    static let shared = APIManager()
    
    func fetchGenres(completion: @escaping(Result<MVGenreCollection, Error>) -> Void) {
        guard let url = URL(string: Endpoints.genreList) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode)
            else {
                print("HTTP Response not success")
                completion(.failure(error!))
                return
            }
            
            if let data = data {
                do{
                    let genres = try JSONDecoder().decode(MVGenreCollection.self, from: data)
                    completion(.success(genres))
                } catch {
                    print("JSON Decoder error:", error.localizedDescription)
                    completion(.failure(error))
                }
            } else {
                print("Data error:", error!.localizedDescription)
                completion(.failure(error!))
            }
        }.resume()
        
        
    }
    
}
