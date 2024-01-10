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

        // MARK: - Variables
        var isInFavorite = false

        // MARK: - Initializers
        init(item: CharacterModel) {
            self.item = item

            isInFavorite = PersistenceController.shared.isInFavorite(id: item.id)
        }

        // MARK: - Functions
        func favoriteButtonTapped() {
            if isInFavorite {
                removeFromFavorite(id: item.id)
            } else {
                addToFavorite(id: item.id)
            }

            isInFavorite = PersistenceController.shared.isInFavorite(id: item.id)
        }

        func removeFromFavorite(id: String) {
            PersistenceController.shared.removeFavorite(id: id)
        }

        func addToFavorite(id: String) {
            PersistenceController.shared.addFavorite(id: id)
        }
    }
}
