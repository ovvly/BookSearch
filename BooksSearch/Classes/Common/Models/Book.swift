//
// Created by Jakub Sowa on 17/12/2021.
//

import Foundation

struct Book: Decodable {
    let id: String
    let link: URL
    let title: String
    let authors: [String]

    private enum CodingKeys: String, CodingKey {
        case id
        case link = "selfLink"
        case volumeInfo
    }

    private enum VolumeCodingKeys: String, CodingKey {
        case title
        case authors
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.link = try container.decode(URL.self, forKey: .link)
        let volumeInfoContainer = try container.nestedContainer(keyedBy: VolumeCodingKeys.self, forKey: .volumeInfo)
        self.title = try volumeInfoContainer.decode(String.self, forKey: .title)
        self.authors = (try? volumeInfoContainer.decode([String].self, forKey: .authors)) ?? []
    }
}

extension Book: Identifiable {
    typealias ID = String
}

extension Book {
    var author: String {
        authors.joined(separator: ", ")
    }
}
