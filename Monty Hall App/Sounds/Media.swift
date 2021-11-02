//
//  Media.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 02/11/21.
//

import Foundation

/// Media Model
/// It is composed by a title and a type
struct Media {
    let title: String
    let type: String
    /// Initializes a media
    init (title: String, type: String) {
        self.title = title
        self.type = type
    }
}
