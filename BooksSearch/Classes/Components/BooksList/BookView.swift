//
//  BookView.swift
//  BooksSearch
//
//  Created by Jakub Sowa on 17/12/2021.
//

import SwiftUI

struct BookView: View {
    let title: String
    let author: String
    let image: Image
    
    var body: some View {
        HStack {
            image
                .resizable()
                .frame(width: 60, height: 60)
            VStack {
                Text(title)
                Text(author)
            }
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(title: "title", author: "author", image: Image("book_placeholder"))
    }
}
