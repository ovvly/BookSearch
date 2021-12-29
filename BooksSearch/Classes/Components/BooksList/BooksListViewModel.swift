import Foundation
import Combine

@MainActor
final class BooksListViewModel: ObservableObject {
    @Published var title = "books"
    @Published var books: [Book] = []
    
    func set(books: [Book]) {
        self.books = books
    }
}
