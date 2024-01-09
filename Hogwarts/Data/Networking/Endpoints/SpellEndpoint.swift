//
//  SpellEndpoint.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/9/24.
//

import Foundation

enum SpellEndpoint {
    case spells
}

extension SpellEndpoint: Endpoint {
    var baseURL: String {
        "https://hp-api.onrender.com/api"
    }

    var basePath: String {
        "/spells"
    }

    var path: String {
        ""
    }

    var method: HTTPMethod {
        .get
    }

    var parameters: Encodable? {
        nil
    }
}
