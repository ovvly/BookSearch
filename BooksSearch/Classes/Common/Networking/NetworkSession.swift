//
// Created by Jakub Sowa on 16/12/2021.
//

import Foundation

protocol NetworkSession {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: NetworkSession {
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        try await data(for: request, delegate: nil)
    }
}
