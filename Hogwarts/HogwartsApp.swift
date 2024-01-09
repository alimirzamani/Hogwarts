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
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
