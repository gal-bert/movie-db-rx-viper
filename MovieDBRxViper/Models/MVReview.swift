//
//  MVReview.swift
//  MovieDBRxViper
//
//  Created by Gregorius Albert on 31/01/23.
//

import Foundation

struct MVReview: Codable {
    var author: String?
    var author_details: MVAuthor?
    var content: String?
    var created_at: String?
    var url: String?
}
