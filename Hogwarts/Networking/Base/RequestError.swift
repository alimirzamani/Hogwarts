//
//  RequestError.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/9/24.
//

import Foundation

enum RequestError: Error {
    case invalidRequest
    case mappingError(_ error: Error)
    case networkError
    case badRequest
    case serverError
    case unauthorized
    case accessDenied
    case unexpectedError(_ statusCode: Int)
}

extension RequestError {
    var localizedDescription: String {
        switch self {
        case .invalidRequest:
            NSLocalizedString("There is a problem with request", comment: "")

        case .mappingError(let error):
            NSLocalizedString("Mapping Error:\n \(error.localizedDescription)", comment: "")

        case .networkError:
            NSLocalizedString("There is a problem with network. Please Check your internet connection", comment: "")

        case .badRequest:
            NSLocalizedString("Bad Request", comment: "")

        case .serverError:
            NSLocalizedString("There is a problem with the server. Please try again later.", comment: "")

        case .unauthorized:
            NSLocalizedString("You need to be authorized to do this action.", comment: "")

        case .accessDenied:
            NSLocalizedString("You don't have the access to do this action.", comment: "")

        case .unexpectedError(let statusCode):
            NSLocalizedString("Unexpected Status Code: \(statusCode)", comment: "")
        }
    }
}
