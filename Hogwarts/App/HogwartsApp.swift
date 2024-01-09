//
//  HogwartsApp.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/9/24.
//

import SwiftUI

@main
struct HogwartsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
