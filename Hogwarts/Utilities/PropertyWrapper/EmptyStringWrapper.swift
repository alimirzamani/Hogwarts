//
//  EmptyStringWrapper.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/10/24.
//

import Foundation

@propertyWrapper
struct EmptyStringWrapper: Codable {
    var wrappedValue: String?

    init(wrappedValue: String?) {
        self.wrappedValue = wrappedValue
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let content = try? container.decode(String.self), !content.isEmpty {
            wrappedValue = content
        } else {
            wrappedValue = nil
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
}
