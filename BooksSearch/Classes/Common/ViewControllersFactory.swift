//
// Created by Jakub Sowa on 16/12/2021.
//

import Foundation
import UIKit
import SwiftUI

final class ViewControllersFactory {
    private let dependencyManager = Dependencies()

    func createBooksListViewController() -> UIViewController {
        let interactor = DefaultBooksListInteractor()
        let view = BooksListView(interactor: interactor, viewModel: interactor.viewModel)
        return UIHostingController(rootView: view)
    }
}
