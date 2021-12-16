//
//  FlowController.swift
//  BooksSearch
//
//  Created by Jakub Sowa on 16/12/2021.
//

import Foundation
import UIKit

final class FlowController {

    func rootViewController() -> UIViewController {
        createRootViewController()
    }

    //MARK: View Controllers creation

    func createRootViewController() -> UIViewController {
        ViewController()
    }
}
