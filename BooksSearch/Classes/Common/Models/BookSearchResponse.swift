//
// Created by Jakub Sowa on 17/12/2021.
//

import Foundation

struct BookSearchResponse: Decodable {
    let items: [Book]

    private enum CodingKeys: String, CodingKey {
        case items
    }
}
