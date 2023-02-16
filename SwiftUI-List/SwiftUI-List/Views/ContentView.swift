//
//  ContentView.swift
//  SwiftUI-List
//
//  Created by Morshed Alam on 15/2/23.
//

import SwiftUI

struct ContentView: View {
    @State var libaray = Library()
    var body: some View {
        NavigationView{
            List(libaray.sortedBooks, id: \.self){ book in
                BookRow(book: book, image: $libaray.images[book])
            }.navigationTitle("My Library")
        }
    }
}

struct BookRow: View {
    let book: Book
    @Binding var image: Image?
    
    var body: some View {
        NavigationLink(destination: DetailView(book: book, image: $image)) {
            HStack{
                Book.Image(image: image, title: book.title, size: 80, cornerRadius: 12)
                TitleAndAuthorStack(book: book, titleFont: .title2, authorFont: .title3)
                    .lineLimit(1)
            }
        }
        .padding(.vertical)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


