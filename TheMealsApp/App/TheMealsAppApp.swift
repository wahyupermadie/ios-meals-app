//
//  TheMealsAppApp.swift
//  TheMealsApp
//
//  Created by Wahyu Permadi on 19/11/20.
//

import SwiftUI

@main
struct TheMealsAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
