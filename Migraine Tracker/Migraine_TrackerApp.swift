//
//  Migraine_TrackerApp.swift
//  Migraine Tracker
//
//  Created by Filby, Vincent on 4/17/22.
//

import SwiftUI

@main
struct Migraine_TrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
