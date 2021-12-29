//
// Created by Jakub Sowa on 17/12/2021.
//

import Foundation

enum NetworkingError: Error {
    case failedToBuildRequest
    case requestPayloadParsingError(Error?)
    case invalidResponse
    case invalidStatusCode(httpCode: Int)
    case parsingError(description: String)
}

extension NetworkingError: PresentableError {
    var title: String {
        "Error"
    }
    
    var messsage: String {
        switch self {
        case .failedToBuildRequest,
                .requestPayloadParsingError,
                .invalidResponse,
                .invalidStatusCode,
                .parsingError: return "Ups"
        }
    }
}
