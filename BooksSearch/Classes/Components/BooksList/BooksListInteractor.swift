import Foundation

protocol BooksListInteractor {
    func start()
}

enum BooksListAction {

}

final class DefaultBooksListInteractor: BooksListInteractor {
    var viewModel = BooksListViewModel()
    var actionHandler: ((BooksListAction) -> Void)?

    private let apiClient: ApiClient

    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    func start() {
        Task {
            do {
                let booksResponse = try await apiClient.request(resource: SearchBookResource(searchTerm: "flowers"))
                let books = booksResponse.items
                print(books)
            } catch {
                print(error)
            }
        }
    }
}
