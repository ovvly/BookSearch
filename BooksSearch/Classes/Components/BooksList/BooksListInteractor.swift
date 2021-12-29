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
            await fetchBooks()
        }
    }
    
    private func fetchBooks() async {
        do {
            let booksResponse = try await apiClient.request(resource: SearchBookResource(searchTerm: "flowers"))
            await viewModel.set(books: booksResponse.items)
        } catch {
            await show(error: error, durationInSeconds: 2)
        }
    }
    
    private func show(error: Error, durationInSeconds: Int) async {
        let errorMessage = (error as? PresentableError)?.messsage ?? error.localizedDescription
        await viewModel.show(error: errorMessage)
        await Task.sleep(UInt64(durationInSeconds) * 1_000_000_000)
        await viewModel.hideError()
    }
}
