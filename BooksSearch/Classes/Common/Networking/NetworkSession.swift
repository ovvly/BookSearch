//
// Created by Jakub Sowa on 16/12/2021.
//

import Foundation

protocol NetworkSession {
    func data(request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: NetworkSession {
    func data(request: URLRequest) async throws -> (Data, URLResponse) {
        await try data(request: request)
    }
}
