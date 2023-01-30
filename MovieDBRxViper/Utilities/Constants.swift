//
//  Constants.swift
//  MovieDBRxViper
//
//  Created by Gregorius Albert on 30/01/23.
//

import Foundation

enum Constants {
    static let apiKey = "cf6ff128d6f885861be040c106d8f2e0"

    static let endpoint = "https://api.themoviedb.org/3"
    static let imageEndpoint = "https://image.tmdb.org/t/p/w500/"
    static let youtubeEndpoint = "https://www.youtube.com/watch?v="

    static let genreListPath = "/genre/movie/list"
    static let movieListPath = "/discover/movie"
    static let moviePath = "/movie"      //../movie/{movie_id}
    static let reviewPath = "/reviews"   //../movie/{movie_id}/reviews
    static let videoPath = "/videos"     //../movie/{movie_id}/videos

    static let genreList = "\(Constants.endpoint)\(Constants.genreListPath)"
    static let movieList = "\(Constants.endpoint)\(Constants.movieListPath)"
    static let movie = "\(Constants.endpoint)\(Constants.moviePath)"
}
