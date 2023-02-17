//
//  NewBookView.swift
//  SwiftUI-List
//
//  Created by Morshed Alam on 16/2/23.
//

import SwiftUI

struct NewBookView: View {
    @ObservedObject var book = Book(title: "", author: "")
    @State var image: Image? = nil
    @EnvironmentObject var libary: Library
    
    var body: some View {
        NavigationView {
            VStack(spacing: 24){
                TextField("Title", text: $book.title)
                TextField("Author", text: $book.author)
                ReviewAndImageStack(book: book, image: $image)
            }
            .padding()
            .navigationTitle("Got a new book?")
            .toolbar {
                ToolbarItem(placement: .status) {
                    Button("Add to Library") {
                        libary.addNewBook(book, image: image)
                    }
                }
            }
        }
    }
}

struct NewBookView_Previews: PreviewProvider {
    static var previews: some View {
        NewBookView().environmentObject(Library())
    }
}
