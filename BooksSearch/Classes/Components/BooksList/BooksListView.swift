import SwiftUI

struct BooksListView: View {
    var interactor: BooksListInteractor?
    @ObservedObject var viewModel = BooksListViewModel()

    var body: some View {
        VStack {
            List {
                ForEach(viewModel.books) { book in
                    BookView(title: book.title, author: book.author, image: Image("book_placeholder"))
                }
            }
        }
        Text(viewModel.title)
            .onAppear {
                interactor?.start()
            }
    }
}

struct BooksListView_Previews: PreviewProvider {
    static var previews: some View {
        BooksListView(interactor: BooksListInteractorStub(), viewModel: BooksListViewModel())
    }
}

private final class BooksListInteractorStub: BooksListInteractor {
    func start() { }
}
