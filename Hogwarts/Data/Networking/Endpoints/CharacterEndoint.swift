//
//  CharacterEndoint.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/9/24.
//

import Foundation

enum CharacterEndoint {
    case characters
    case character(id: String)
    case students
    case staff
    case houseCharacters(name: String)
}

extension CharacterEndoint: Endpoint {
    var baseURL: String {
        AppConstants.baseURL
    }

    var basePath: String {
        switch self {
        case .character:
            "/character"

        default:
            "/characters"
        }
    }

    var path: String {
        switch self {
        case .characters:
            ""

        case .character(let id):
            "\(id)"

        case .students:
            "/students"

        case .staff:
            "/staff"

        case .houseCharacters(let name):
            "/house/\(name)"
        }
    }

    var method: HTTPMethod {
        .get
    }

    var parameters: Encodable? {
        nil
    }
}
