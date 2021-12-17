//
// Created by Jakub Sowa on 16/12/2021.
//

import Foundation

typealias NetworkResponse = (response: HTTPURLResponse, data: Data)

protocol ApiClient {
    func request<R: Resource>(resource: R, with decoder: DataParser) async throws -> R.ResourceType
    func request<R: Resource>(resource: R) async throws -> R.ResourceType
}

final class NetworkClient: ApiClient {
    private let networkSession: NetworkSession

    init(with urlSession: NetworkSession) {
        self.networkSession = urlSession
    }

    func request<R: Resource>(resource: R) async throws -> R.ResourceType {
        try await request(resource: resource, with: JSONDecoder())
    }

    func request<R: Resource>(resource: R, with decoder: DataParser) async throws -> R.ResourceType {
        let request = try buildUrlRequest(for: resource)
        let (data, _) = await try networkSession.data(request: request)
        return try resource.parse(data, with: decoder)
    }

    private func buildUrlRequest<R: Resource>(for resource: R) throws -> URLRequest {
        guard let requestURL = url(for: resource) else {
            throw NetworkingError.failedToBuildRequest
        }
        var request = URLRequest(url: requestURL)
        request.httpMethod = resource.httpRequestMethod.value
        request.httpBody = try resource.buildRequestBody()
        return request
    }

    private func url<R: Resource>(for resource: R) -> URL? {
        guard var urlComponents = URLComponents(string: resource.path) else { return nil }
        urlComponents.queryItems = resource.queryItems
        return urlComponents.url
    }
}

private extension Resource {
    var queryItems: [URLQueryItem]? {
        query?.compactMap { key, value in
            URLQueryItem(name: key, value: value?.stringValue)
        }
    }

    func buildRequestBody() throws -> Data? {
        guard let requestParameters = body else { return nil }
        return try JSONSerialization.data(withJSONObject: requestParameters, options: .prettyPrinted)
    }
}
