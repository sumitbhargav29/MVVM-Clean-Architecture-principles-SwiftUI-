//
//  MVVM_Clean_Architecture_principles_SwiftUI_App.swift
//  MVVM-Clean-Architecture-principles-SwiftUI-
//
//  Created by Sam's Mac on 05/09/25.
//

import SwiftUI
 
@main
struct MVVM_Clean_Architecture_principles_SwiftUI_App: App {
    @StateObject private var deps = AppDependencies()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(deps)
        }
    }
}
