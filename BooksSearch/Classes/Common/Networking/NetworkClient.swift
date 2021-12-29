//
// Created by Jakub Sowa on 16/12/2021.
//

import Foundation

protocol ApiClient {
    func request<R: Resource>(resource: R, with decoder: DataParser) async throws -> R.ResourceType
    func request<R: Resource>(resource: R) async throws -> R.ResourceType
}

final class NetworkClient: ApiClient {
    private let networkSession: NetworkSession
    private let host: String

    init(with urlSession: NetworkSession, host: String = "https://www.googleapis.com/books/v1") {
        self.networkSession = urlSession
        self.host = host
    }

    func request<R: Resource>(resource: R) async throws -> R.ResourceType {
        try await request(resource: resource, with: JSONDecoder())
    }

    func request<R: Resource>(resource: R, with decoder: DataParser) async throws -> R.ResourceType {
        let request = try buildUrlRequest(for: resource)
        let (data, urlResponse) = try await networkSession.data(for: request)
        guard let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode else {
            throw NetworkingError.invalidResponse
        }
        guard 200..<300 ~= statusCode else {
            throw NetworkingError.invalidStatusCode(httpCode: statusCode)            
        }
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
        guard var urlComponents = URLComponents(string: host) else { return nil }
        urlComponents.path.append("/\(resource.path)")
        urlComponents.queryItems = resource.queryItems
        urlComponents.add(apiKey: ApiKeys.googleApiKey.rawValue)
        return urlComponents.url
    }
}

private extension URLComponents {
    mutating func add(apiKey: String) {
        queryItems?.append(URLQueryItem(name: "key", value: apiKey))
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
