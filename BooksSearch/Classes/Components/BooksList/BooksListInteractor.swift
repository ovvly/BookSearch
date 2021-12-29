import Foundation

protocol BooksListInteractor {
    func start()
}

enum BooksListAction {

}

final class DefaultBooksListInteractor: BooksListInteractor {
    var actionHandler: ((BooksListAction) -> Void)?
    private let viewModel: BooksListViewModel
    private let apiClient: ApiClient
    
    init(apiClient: ApiClient, viewModel: BooksListViewModel) {
        self.apiClient = apiClient
        self.viewModel = viewModel
    }

    func start() {
        Task {
            do {
                let booksResponse = try await apiClient.request(resource: SearchBookResource(searchTerm: "flowers"))
                await viewModel.set(books: booksResponse.items)
            } catch {
                print(error)
            }
        }
    }
}
