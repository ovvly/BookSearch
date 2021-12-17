//
// Created by Jakub Sowa on 16/12/2021.
//

import Foundation

protocol DataParser {
    var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy { get set }
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
}

extension JSONDecoder: DataParser { }

protocol DataEncoder {
    func encode<T>(_ value: T) throws -> Data where T : Encodable
}

extension JSONEncoder: DataEncoder { }
