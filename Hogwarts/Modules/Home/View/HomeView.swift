//
//  HomeView.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/9/24.
//

import SwiftUI

struct HomeView: View {

    // MARK: - States
    @State private var viewModel: ViewModel

    // MARK: - Initializers
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body
    var body: some View {
        NavigationStack {
            List(viewModel.items, id: \.id) { item in
                NavigationLink {
                    CharacterView(viewModel: .init(item: item))
                } label: {
                    HomeItemView(item: item)
                }
                .listRowBackground(Color.clear)
            }
            .task {
                await viewModel.loadData()
            }
            .listStyle(.grouped)
            .navigationTitle("Hogwarts")
            .alert("Oops!", isPresented: $viewModel.isAlertShowing) {
            } message: {
                Text(viewModel.alert)
            }
        }
    }
}

#Preview {
    let repository = CharacterRepository.shared
    return HomeView(viewModel: .init(characterRepository: repository))
}
