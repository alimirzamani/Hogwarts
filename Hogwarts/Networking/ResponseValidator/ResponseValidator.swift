//
//  ResponseValidator.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/9/24.
//

import Foundation

struct ResponseValidator: ResponseValidatorProtocol {

    // MARK: - Constants
    static let shared = ResponseValidator()

    // MARK: - Initializers
    private init() { }

    // MARK: - Functinos
    func validation<T: Decodable>(data: Data, response: HTTPURLResponse?) throws -> T {
        guard let response else {
            throw RequestError.invalidRequest
        }

        let statusCode = response.statusCode

        switch statusCode {
        case 200 ... 299:
            do {
                let decoder = CustomJSONDecoder()
                return try decoder.decode(T.self, from: data)
            } catch {
                throw RequestError.mappingError(error)
            }

        case 401:
            throw RequestError.unauthorized

        case 403:
            throw RequestError.accessDenied

        case 400 ... 499:
            throw RequestError.badRequest

        case 500 ... 599:
            throw RequestError.serverError

        default:
            throw RequestError.unexpectedError(statusCode)
        }
    }
}
