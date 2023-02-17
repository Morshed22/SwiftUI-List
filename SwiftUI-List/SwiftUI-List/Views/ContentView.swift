//
//  ContentView.swift
//  SwiftUI-List
//
//  Created by Morshed Alam on 15/2/23.
//

import SwiftUI

struct ContentView: View {
    @State var addingNewBook = false
    @EnvironmentObject var libaray: Library

    var body: some View {
        NavigationView {
            List {
                Button {
                    addingNewBook = true
                } label: {
                    Spacer()
                    VStack(spacing: 6){
                        Image(systemName: "book.circle")
                            .font(.system(size: 60))
                        Text("Add New Book")
                            .font(.title2)
                    }
                    Spacer()
                }
                .buttonStyle(.borderless)
                .padding(.vertical, 8)
                .sheet(isPresented: $addingNewBook, content: NewBookView.init)
                
                ForEach(libaray.sortedBooks){ book in
                    BookRow(book: book)
                }
                .navigationTitle("My Library")
            }
        }
    }
}

struct BookRow: View {
    @ObservedObject var book: Book
    @EnvironmentObject var library: Library
    
    var body: some View {
        NavigationLink(destination: DetailView(book: book)) {
            HStack{
                Book.Image(image: library.images[book], title: book.title, size: 80, cornerRadius: 12)
                VStack(alignment: .leading) {
                    TitleAndAuthorStack(book: book, titleFont: .title2, authorFont: .title3)
                    if !book.microReview.isEmpty{
                        Spacer()
                        Text(book.microReview)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .lineLimit(1)
            }
            .padding(.vertical)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Library())
            .previewInAllColorSchemes
    }
}


