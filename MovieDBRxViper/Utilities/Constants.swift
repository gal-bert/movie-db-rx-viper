//
//  Constants.swift
//  MovieDBRxViper
//
//  Created by Gregorius Albert on 30/01/23.
//

import Foundation

enum Constants {
    static let endpoint = "https://api.themoviedb.org/3"
    static let imagePath = "https://image.tmdb.org/t/p/w500/"
    static let apiKey = "cf6ff128d6f885861be040c106d8f2e0"
    static let genreListUrl = "/genre/movie/list"
    static let movieListUrl = "/discover/movie"
    static let movieUrl = "/movie/"
    static let genreList = "\(Constants.endpoint)\(Constants.genreListUrl)"
    static let movieList = "\(Constants.endpoint)\(Constants.movieListUrl)"
    static let movie = "\(Constants.endpoint)\(Constants.movieUrl)"
}
