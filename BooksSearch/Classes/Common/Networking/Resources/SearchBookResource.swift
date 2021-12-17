//
// Created by Jakub Sowa on 17/12/2021.
//

import Foundation

struct SearchBookResource: Resource {
    typealias ResourceType = BookSearchResponse

    let path = "volumes"
    let query: Parameters?
    let httpRequestMethod = RequestMethod.GET

    init(searchTerm: String) {
        self.query = ["q": searchTerm]
    }
}
