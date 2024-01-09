//
//  CharacterModel.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/9/24.
//

import Foundation

struct CharacterModel: Codable {
    let id: String
    let name: String
    let alternateNames: [String]
    let species: String
    let gender: String
    @EmptyStringWrapper var house: String?
    let dateOfBirth: String?
    let yearOfBirth: Int?
    let wizard: Bool
    let ancestry: String
    let eyeColour: String
    let hairColour: String
    let wand: WandModel
    let patronus: String
    let hogwartsStudent: Bool
    let hogwartsStaff: Bool
    @EmptyStringWrapper var actor: String?
    let alternateActors: [String]
    let alive: Bool
    @URLOptionalWrapper var image: URL?
}

// MARK: - Mocks
extension CharacterModel {
    static let mock = CharacterModel(
        id: "4c7e6819-a91a-45b2-a454-f931e4a7cce3",
        name: "Hermione Granger",
        alternateNames: ["Hermy","Know-it-all","Miss Grant","Herm-own-ninny"],
        species: "human",
        gender: "female",
        house: "Gryffindor",
        dateOfBirth: "19-09-1979",
        yearOfBirth: 1979,
        wizard: true,
        ancestry: "muggleborn",
        eyeColour: "brown",
        hairColour: "brown",
        wand: .mock,
        patronus: "otter",
        hogwartsStudent: true,
        hogwartsStaff: false,
        actor: "Emma Watson",
        alternateActors: [],
        alive: true,
        image: URL(string: "https://ik.imagekit.io/hpapi/hermione.jpeg"))
}
