//
//  CharacterImage.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/10/24.
//

import SwiftUI

struct CharacterImage: View {

    // MARK: - Variables
    var url: URL?

    // MARK: - Body
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Color.gray
        }
        .clipShape(.rect(cornerRadius: 8))
        .frame(width: 70, height: 100)
    }
}

#Preview {
    CharacterImage()
}
