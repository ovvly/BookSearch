//
// Created by Jakub Sowa on 16/12/2021.
//

import Foundation
import UIKit
import SwiftUI

final class ViewControllersFactory {
    private let dependencies = Dependencies()

    func createBooksListViewController() -> UIViewController {
        var view = BooksListView()
        let interactor = DefaultBooksListInteractor(apiClient: dependencies.apiClient, viewModel: view.viewModel)
        view.interactor = interactor
        return UIHostingController(rootView: view)
    }
}
