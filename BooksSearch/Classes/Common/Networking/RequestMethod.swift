//
// Created by Jakub Sowa on 16/12/2021.
//

import Foundation

enum RequestMethod: String {
    case GET
    case POST
    case PUT
    case PATCH
    case DELETE
}

extension RequestMethod {
    var value: String {
        rawValue
    }
}
