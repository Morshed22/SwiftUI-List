//
//  Book.swift
//  SwiftUI-List
//
//  Created by Morshed Alam on 15/2/23.
//

import Foundation

class Book {
    let title: String
    let author: String
    var microReview: String
    var readMe: Bool
    
    init(title: String = "Title", author: String = "Author", microReview:String = "", readMe:Bool = true) {
        self.title = title
        self.author = author
        self.microReview = microReview
        self.readMe = readMe
    }
}

extension Book: Hashable, Identifiable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Book: Equatable{
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs === rhs
    }
    
}