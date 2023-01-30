import UIKit

struct MVMovieCollection: Codable {
    var page: Int?
    var results: [MVMovie]?
    var total_pages: Int?
    var total_results: Int?
}

struct MVMovie: Codable {
    var adult: Bool
    var backdrop_path: String
    var genre_ids: [Int]
    var id: Int
    var original_language: String
    var original_title: String
    var overview: String
    var popularity: Double
    var poster_path: String
    var release_date: String
    var title: String
    var video: Bool
    var vote_average: Double
    var vote_count: Int
}

func fetchRelatedMovies(genreId: Int, page: Int, completion: @escaping(Result<[MVMovie], Error>) -> Void) {
    
    var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=cf6ff128d6f885861be040c106d8f2e0&with_genres=28&page=1")!)
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
                guard let movies = movies.results else { return }
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

fetchRelatedMovies(genreId: 28, page: 1) { response in
    switch response {
    case .success(let movies):
        for movie in movies {
            print(movie.id, movie.title)
        }
    case .failure(let error):
        print(error)
    }
}
