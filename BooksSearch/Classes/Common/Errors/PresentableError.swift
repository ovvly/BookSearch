//
//  PresentableError.swift
//  BooksSearch
//
//  Created by Jakub Sowa on 29/12/2021.
//

import Foundation

protocol PresentableError: Error {
    var title: String { get }
    var messsage: String { get }
}
