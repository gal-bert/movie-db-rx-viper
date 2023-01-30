//
//  MVMovieCollection.swift
//  MovieDBRxViper
//
//  Created by Gregorius Albert on 30/01/23.
//

import Foundation

struct MVMovieCollection: Codable {
    var page: Int?
    var results: [MVMovie]?
    var total_pages: Int?
    var total_results: Int?
}
