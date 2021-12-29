import Foundation
import Combine

@MainActor
final class BooksListViewModel: ObservableObject {
    @Published var title = "books"
    @Published var books: [Book] = []
    @Published var errorInfo: String? = nil
    
    func set(books: [Book]) {
        self.books = books
    }
    
    func show(error: String) {
        self.errorInfo = error
    }
    
    func hideError() {
        errorInfo = nil
    }
}
