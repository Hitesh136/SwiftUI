//
//  DetailView.swift
//  Bookworm
//
//  Created by Hitesh Agarwal on 25/01/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import CoreData
import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var presantatioMode
    @Environment(\.managedObjectContext) var moc
    
    @State var showDeleteAlert = false
    let book: Book
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(self.book.genre ?? "Fantasy")
                        .frame(maxWidth: geometry.size .width)
                    
                    Text((self.book.genre ?? "Fantasy").uppercased())
                        .font(.caption)
                        .foregroundColor(.white)
                        .fontWeight(.black)
                        .padding(8)
                        .background(Color.black.opacity(0.75))
                        .clipShape(Capsule())
                        .offset(x: -5, y: -5)
                    
                }
                
                Text(self.book.author ?? "Unkown author")
                    .foregroundColor(.secondary)
                    .font(.title)
                
                Text(self.book.review ?? "No review")
                    .padding()

                RatingView(rating: .constant(Int(self.book.rating)))
                    .font(.largeTitle)
                Spacer()
                    
            }
        }
        .navigationBarTitle(Text(self.book.title ?? "Unknown book"), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showDeleteAlert = true
        }, label: {
            Image(systemName: "trash")
        }))
        .alert(isPresented: $showDeleteAlert) {
            Alert(title: Text("Delete Book"),
                  message: Text("Are you sure"),
                  primaryButton: .destructive(Text("Delete"), action: {
                self.delete()
            }), secondaryButton: .cancel())
        }
    }
    
    func delete() {
        moc.delete(book)
        presantatioMode.wrappedValue.dismiss()
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    static var previews: some View {
        let previewBook = Book(context: moc)
        previewBook.author = "Auther Name"
        previewBook.genre = "Romance"
        previewBook.id = UUID()
        previewBook.review = "This is the best romance book"
        previewBook.title = "The Deep Romance"
        previewBook.rating = 5
        return NavigationView {
            DetailView(book: previewBook)
        }
    }
}
