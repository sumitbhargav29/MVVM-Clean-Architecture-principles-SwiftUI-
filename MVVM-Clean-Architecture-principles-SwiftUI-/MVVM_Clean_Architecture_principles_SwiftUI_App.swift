//
//  MVVM_Clean_Architecture_principles_SwiftUI_App.swift
//  MVVM-Clean-Architecture-principles-SwiftUI-
//
//  Created by Sam's Mac on 05/09/25.
//

import SwiftUI
import SwiftData

@main
struct MVVM_Clean_Architecture_principles_SwiftUI_App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
