//
//  CharacterView.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/10/24.
//

import SwiftUI

struct CharacterView: View {

    // MARK: - States
    @State private var viewModel: ViewModel

    // MARK: - Initializers
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    CharacterImage(url: viewModel.item.image)
                    VStack(alignment: .leading, spacing: 20) {
                        VStack(alignment: .leading) {
                            Text(viewModel.item.name)
                                .font(.headline)

                            if let house = viewModel.item.house {
                                Text(house)
                                    .font(.subheadline)
                            }
                        }

                        if let actor = viewModel.item.actor {
                            Text("Played by \(actor)")
                                .font(.caption)
                        }
                    }
                    Spacer()
                }
                .padding([.leading, .trailing])
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CharacterView(viewModel: .init(item: .mock))
}
