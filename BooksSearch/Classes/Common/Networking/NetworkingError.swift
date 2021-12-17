//
// Created by Jakub Sowa on 17/12/2021.
//

import Foundation

enum NetworkingError: Error {
    case failedToBuildRequest
    case requestPayloadParsingError(Error?)
    case invalidStatusCode(httpCode: Int)
    case parsingError(description: String)
}
