//
//  HomeView-ViewModel.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/9/24.
//

import Foundation

extension HomeView {
    @Observable
    class ViewModel {

        // MARK: - Constants
        private let characterRepository: CharacterRepositoryType

        // MARK: - Variables
        var items = [CharacterModel]()
        var alert = ""
        var isAlertShowing = false

        // MARK: - Initializers
        init(characterRepository: CharacterRepositoryType) {
            self.characterRepository = characterRepository
        }

        // MARK: - Functions
        func loadData() async {
            do {
                items = try await characterRepository.getCharacters()
            } catch {
                guard let error = error as? RequestError else { return }
                alert = error.localizedDescription
                isAlertShowing = true
            }
        }
    }
}
