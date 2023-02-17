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
        NavigationView {
            List {
                Button {
                    
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
                
                ForEach(libaray.sortedBooks){ book in
                    BookRow(book: book, image: $libaray.images[book])
                }
                .navigationTitle("My Library")
            }
        }
    }
}

struct BookRow: View {
    @ObservedObject var book: Book
    @Binding var image: Image?
    
    var body: some View {
        NavigationLink(destination: DetailView(book: book, image: $image)) {
            HStack{
                Book.Image(image: image, title: book.title, size: 80, cornerRadius: 12)
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
            .previewInAllColorSchemes
    }
}


