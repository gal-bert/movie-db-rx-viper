//
//  MVReview.swift
//  MovieDBRxViper
//
//  Created by Gregorius Albert on 31/01/23.
//

import Foundation

struct MVAuthor {
    var name: String?
    var username: String?
    var avatar_path: String?
    var rating: Double?
}

struct MVReview {
    var author: String?
    var author_details: MVAuthor?
    var content: String?
    var created_at: String?
    var url: String?
}
