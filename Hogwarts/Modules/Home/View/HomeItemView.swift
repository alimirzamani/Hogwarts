//
//  HomeItemView.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/10/24.
//

import SwiftUI

struct HomeItemView: View {

    // MARK: - Variables
    var item: CharacterModel

    var body: some View {
        HStack {
            CharacterImage(url: item.image)
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)

                    if let house = item.house {
                        Text(house)
                            .font(.subheadline)
                    }
                }

                if let actor = item.actor {
                    Text("Played by \(actor)")
                        .font(.caption)
                }
            }
        }
        .listRowBackground(Color.clear)
    }
}

#Preview {
    HomeItemView(item: .mock)
}
