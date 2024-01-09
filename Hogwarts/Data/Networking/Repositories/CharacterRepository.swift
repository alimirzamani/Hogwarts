//
//  CharacterRepository.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/9/24.
//

import Foundation

protocol CharacterRepositoryType {
    func getCharacters() async throws -> [CharacterModel]
}

struct CharacterRepository: HTTPClient, CharacterRepositoryType {

    // MARK: - Constants
    static let shared = CharacterRepository(responseValidator: ResponseValidator.shared)

    // MARK: - Variables
    var responseValidator: ResponseValidatorProtocol

    // MARK: - Initializers
    private init(responseValidator: ResponseValidatorProtocol) {
        self.responseValidator = responseValidator
    }

    // MARK: - Functinos
    func getCharacters() async throws -> [CharacterModel] {
        return try await request(CharacterEndoint.characters)
    }
}
