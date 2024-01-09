//
//  CustomJSONDecoder.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/9/24.
//

import Foundation

class CustomJSONDecoder: JSONDecoder {

    // MARK: - Initializers
    override init() {
        super.init()

        keyDecodingStrategy = .convertFromSnakeCase
    }
}
