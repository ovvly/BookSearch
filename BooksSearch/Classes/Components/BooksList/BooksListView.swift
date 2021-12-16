import SwiftUI

struct BooksListView: View {
    let interactor: BooksListInteractor
    @ObservedObject var viewModel: BooksListViewModel

    var body: some View {
        Text(viewModel.title)
    }
}

struct BooksListView_Previews: PreviewProvider {
    static var previews: some View {
        BooksListView(interactor: BooksListInteractorStub(), viewModel: BooksListViewModel())
    }
}

private final class BooksListInteractorStub: BooksListInteractor {
}
