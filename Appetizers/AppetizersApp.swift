//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Akanksha Upadhyay on 7/21/24.
//

import SwiftUI

@main
struct AppetizersApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
