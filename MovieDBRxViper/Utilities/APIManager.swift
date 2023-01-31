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
        
        var urlComponents = URLComponents(string: Constants.genreList)
        let queryItems = [
            URLQueryItem(name: "api_key", value: "\(Constants.apiKey)")
        ]
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url  else { return }
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
    
    func fetchRelatedMovies(genreId: Int, page: Int, completion: @escaping(Result<MVMovieCollection, Error>) -> Void) {
        
        var urlComponents = URLComponents(string: Constants.movieList)
        let queryItems = [
            URLQueryItem(name: "api_key", value: "\(Constants.apiKey)"),
            URLQueryItem(name: "language", value: "en-us"),
            URLQueryItem(name: "with_original_language", value: "en"),
            URLQueryItem(name: "with_genres", value: "\(genreId)"),
            URLQueryItem(name: "page", value: "\(page)")
        ]
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url  else { return }
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
                    let movies = try JSONDecoder().decode(MVMovieCollection.self, from: data)
                    completion(.success(movies))
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
    
    func fetchMovieVideos(movieId: Int, completion: @escaping(Result<MVVideoCollection, Error>) -> Void) {
        var urlComponents = URLComponents(string: "\(Constants.movie)/\(movieId)\(Constants.videoPath)")
        let queryItems = [
            URLQueryItem(name: "api_key", value: "\(Constants.apiKey)"),
        ]
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url  else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(url)
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode)
            else {
                print("HTTP Response not success")
                completion(.failure(error!))
                return
            }
            
            if let data = data {
                do{
                    let videos = try JSONDecoder().decode(MVVideoCollection.self, from: data)
                    completion(.success(videos))
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
    
    func fetchReviews(movieId: Int, completion: @escaping(Result<MVReviewCollection, Error>) -> Void) {
        var urlComponents = URLComponents(string: "\(Constants.movie)/\(movieId)\(Constants.reviewPath)")
        let queryItems = [
            URLQueryItem(name: "api_key", value: "\(Constants.apiKey)"),
        ]
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url  else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(url)
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode)
            else {
                print("HTTP Response not success")
                completion(.failure(error!))
                return
            }
            
            if let data = data {
                do{
                    let reviews = try JSONDecoder().decode(MVReviewCollection.self, from: data)
                    completion(.success(reviews))
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
