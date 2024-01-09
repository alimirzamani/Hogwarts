//
//  CharacterView-ViewModel.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/10/24.
//

import Foundation

extension CharacterView {
    @Observable
    class ViewModel {

        // MARK: - Constants
        let item: CharacterModel

        // MARK: - Initializers
        init(item: CharacterModel) {
            self.item = item
        }
    }
}
