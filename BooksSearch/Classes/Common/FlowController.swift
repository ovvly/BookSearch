//
//  FlowController.swift
//  BooksSearch
//
//  Created by Jakub Sowa on 16/12/2021.
//

import Foundation
import UIKit
import SwiftUI

final class FlowController {

    func rootViewController() -> UIViewController {
        createRootViewController()
    }

    //MARK: View Controllers creation

    func createRootViewController() -> UIViewController {
        let interactor = DefaultBooksListInteractor()
        let view = BooksListView(interactor: interactor, viewModel: interactor.viewModel)
        return UIHostingController(rootView: view)
    }
}
