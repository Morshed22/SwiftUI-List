//
//  DetailView.swift
//  SwiftUI-List
//
//  Created by Morshed Alam on 15/2/23.
//
import class PhotosUI.PHPickerViewController
import SwiftUI

struct DetailView: View {
    let book: Book
    @Binding var image: Image?
    @State var showingImagePicker = false
    @State var showingDialog = false
    var body: some View {
        VStack(alignment: .leading) {
            TitleAndAuthorStack(book: book, titleFont: .title, authorFont: .title2)
            VStack {
                Book.Image(image: image,title: book.title, cornerRadius: 16)
                    .scaledToFit()
                HStack {
                    if image != nil{
                        Spacer()
                        Button("Delete Image") {
                            showingDialog = true
                        }
                    }
                    Spacer()
                    Button("Update Image…") {
                        showingImagePicker = true
                    }
                    Spacer()
                }
                .padding()
            }
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showingImagePicker) {
            PHPickerViewController.View(image: $image)
        }
        .confirmationDialog("Delete image for \(book.title)", isPresented: $showingDialog) {
            Button("Delete", role: .destructive){ image = nil }
        } message: {
            Text("Delete image for \(book.title)")
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init(), image: .constant(nil))
            .previewInAllColorSchemes
    }
}
