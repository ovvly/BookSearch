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
    private let viewControllersFactory = ViewControllersFactory()

    func rootViewController() -> UIViewController {
        createRootViewController()
    }

    //MARK: View Controllers creation

    func createRootViewController() -> UIViewController {
        viewControllersFactory.createBooksListViewController()
    }
}
