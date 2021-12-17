//
// Created by Jakub Sowa on 16/12/2021.
//

import Foundation

typealias Parameters = [String: Parameter?]

protocol Parameter {
    var stringValue: String { get }
}

extension String: Parameter {
    var stringValue: String { self }
}

extension Int: Parameter {
    var stringValue: String { String(self) }
}

extension Bool : Parameter {
    var stringValue: String { String(self) }
}

extension Data: Parameter {
    var stringValue: String { String(data: self, encoding: .utf8) ?? "" }
}
