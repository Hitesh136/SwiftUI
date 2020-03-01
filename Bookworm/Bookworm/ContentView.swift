//
//  ContentView.swift
//  Bookworm
//
//  Created by Hitesh Agarwal on 23/01/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Book.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Book.title, ascending: true),
        NSSortDescriptor(keyPath: \Book.author, ascending: true)
    ]) var books: FetchedResults<Book>
    @State var isShowingAddScreen = false
    var body: some View {
        
        
        NavigationView {
            List {
                ForEach(books, id: \.self) { (book: Book) in
                    NavigationLink(destination: DetailView(book: book)) {
                        EmojiRatingView(rating: Int(book.rating)).font(.largeTitle)
                        
                        VStack(alignment: .leading) {
                            Text(book.title ?? "Unknown name")
                                .font(.headline)
                            Text(book.author ?? "Unknown Author")
                                .font(.subheadline)
                        }
                        
                    }
                }
                .onDelete { (indexSet) in
                    self.delete(atIndexSet: indexSet)
                }
            }
        .navigationBarTitle("Bookwrom")
            .navigationBarItems(leading: EditButton(),
                                trailing:
            Button(action: {
                self.isShowingAddScreen.toggle()
            }) {
                Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $isShowingAddScreen) {
            AddBookView().environment(\.managedObjectContext, self.moc)
        }
    }
    
    func delete(atIndexSet indexSet: IndexSet) {
        for index in indexSet {
            let book = books[index]
            moc.delete(book)
            try? moc.save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
