//
// Created by Jakub Sowa on 16/12/2021.
//

import Foundation

enum ErrorParsingResult {
    case error(Error)
    case data(Data)
}

typealias ErrorParser = (Error) -> ErrorParsingResult

protocol Resource {
    associatedtype ResourceType

    var path: String { get }
    var httpRequestMethod: RequestMethod { get }
    var body: [String: Any]? { get }
    var query: Parameters? { get }

    func parse(_ data: Data, with parser: DataParser) throws -> ResourceType
}

extension Resource {
    var body: [String: Any]? { nil }
    var query: Parameters? { nil }
}

extension Resource where ResourceType: Decodable {
    func parse(_ data: Data, with parser: DataParser) throws -> ResourceType {
        try parser.decode(ResourceType.self, from: data)
    }
}

extension Resource where ResourceType == Void {
    func parse(_ data: Data, with parser: DataParser) throws -> ResourceType { }
}
