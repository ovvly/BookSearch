import Foundation

protocol BooksListInteractor {

}

enum BooksListAction {

}

final class DefaultBooksListInteractor: BooksListInteractor {
    var viewModel = BooksListViewModel()
    var actionHandler: ((BooksListAction) -> Void)?

    init() {

    }
}