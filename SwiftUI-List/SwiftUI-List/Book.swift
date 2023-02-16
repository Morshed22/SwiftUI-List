//
//  Book.swift
//  SwiftUI-List
//
//  Created by Morshed Alam on 15/2/23.
//

import Foundation

struct Book {
    let title: String
    let author: String
    
    init(title: String = "Title", author: String = "Author") {
        self.title = title
        self.author = author
    }
}
