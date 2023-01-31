//
//  MVReviewCollection.swift
//  MovieDBRxViper
//
//  Created by Gregorius Albert on 31/01/23.
//

import Foundation

struct MVReviewCollection: Codable {
    var id: Int?
    var page: Int?
    var results: [MVMovie]?
    var total_pages: Int?
    var total_results: Int?
}
