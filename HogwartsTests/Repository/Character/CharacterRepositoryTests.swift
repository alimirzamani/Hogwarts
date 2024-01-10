//
//  CharacterRepositoryTests.swift
//  HogwartsTests
//
//  Created by Ali Mirzamani on 1/10/24.
//

import XCTest
@testable import Hogwarts

final class CharacterRepositoryTests: XCTestCase {

    // MARK: - Variables
    var repository: CharacterRepositoryType!

    // MARK: - Life Cycle
    override func setUp() {
        repository = MockCharacterRepository()
    }

    override func tearDown() {
        repository = nil
    }

    @MainActor
    func testGetCharacters() async {
        let characters = try? await repository.getCharacters()
        XCTAssertNotNil(characters)
        XCTAssertTrue(characters?.count == 404)
    }
}
