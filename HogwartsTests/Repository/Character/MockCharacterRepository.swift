//
//  MockCharacterRepository.swift
//  HogwartsTests
//
//  Created by Ali Mirzamani on 1/10/24.
//

import Foundation
@testable import Hogwarts

struct MockCharacterRepository: CharacterRepositoryType {
    func getCharacters() async throws -> [CharacterModel] {
        let bundle = Bundle(for: CharacterRepositoryTests.self)
        let url = bundle.url(forResource: "characters", withExtension: "json")!
        do {
            let data = try Data(contentsOf: url)
            return try CustomJSONDecoder().decode([CharacterModel].self, from: data)
        } catch {
            throw RequestError.mappingError(error)
        }
    }
}
