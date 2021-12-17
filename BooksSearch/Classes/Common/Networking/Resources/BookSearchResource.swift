//
// Created by Jakub Sowa on 17/12/2021.
//

import Foundation

struct SearchBookResource: Resource {
    typealias ResourceType = Book

    let path = "volumes"
    let query: Parameters?
    let httpRequestMethod = RequestMethod.GET

    init(searchTerm: String) {
        self.query = ["q": searchTerm]
    }
}


struct Book: Decodable {
    let id: String
    let link: URL
    let title: String
    let authors: [String]

    private enum CodingKeys: String, CodingKey {
        case id
        case link = "selfLink"
        case volumeInfo
        case title
        case authors
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.link = try container.decode(URL.self, forKey: .link)
        let volumeInfoContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .volumeInfo)
        self.title = try volumeInfoContainer.decode(String.self, forKey: .title)
        self.authors = try volumeInfoContainer.decode([String].self, forKey: .authors)
    }
}
