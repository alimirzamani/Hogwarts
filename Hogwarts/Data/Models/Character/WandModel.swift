//
//  WandModel.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/9/24.
//

import Foundation

struct WandModel: Codable {
    let wood: String
    let core: String
    let length: Double?
}

// MARK: - Mocks
extension WandModel {
    static let mock = WandModel(wood: "vine", core: "dragon heartstring", length: 10.75)
}
