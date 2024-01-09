//
//  SpellRepository.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/9/24.
//

import Foundation

protocol SpellRepositoryType {
    func getSpells() async throws -> [SpellModel]
}

struct SpellRepository: HTTPClient, SpellRepositoryType {

    // MARK: - Constants
    static let shared = SpellRepository(responseValidator: ResponseValidator.shared)

    // MARK: - Variables
    var responseValidator: ResponseValidatorProtocol

    // MARK: - Initializers
    private init(responseValidator: ResponseValidatorProtocol) {
        self.responseValidator = responseValidator
    }

    // MARK: - Functinos
    func getSpells() async throws -> [SpellModel] {
        return try await request(SpellEndpoint.spells)
    }
}
