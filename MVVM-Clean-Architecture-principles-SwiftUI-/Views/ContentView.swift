//
//  ContentView.swift
//  MVVM-Clean-Architecture-principles-SwiftUI-
//
//  Created by Sam's Mac on 05/09/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var deps: AppDependencies
    @StateObject private var vm: UserListViewModel
    
    init() {
        // ViewModel picks up APIService from environment each time
        _vm = StateObject(wrappedValue: UserListViewModel(serviceProvider: { AppDependencies().apiService() }))
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: deps.themeManager.current.spacing) {
                controls
                
                if vm.isLoading { ProgressView("Loading...") }
                
                if let error = vm.errorMessage {
                    Text(error).foregroundColor(.red)
                }
                
                List {
                    ForEach(vm.users) { user in
                        UserRowView(user: user)
                            .environmentObject(deps)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .padding()
            .background(deps.themeManager.current.background.ignoresSafeArea())
            .navigationTitle("Decoupled Users")
            .toolbar {
                Button("Refresh") { Task { await vm.load() } }
            }
            .onAppear { Task { await vm.load() } }
            .onChange(of: deps.apiType) { _ in Task { await vm.load() } }
        }
    }
    
    private var controls: some View {
        VStack(spacing: 8) {
            HStack {
                Text("API:")
                Picker("API", selection: $deps.apiType) {
                    ForEach(APIServiceType.allCases) { Text($0.rawValue).tag($0) }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            HStack {
                Text("Theme:")
                Picker("Theme", selection: Binding(
                    get: { deps.themeManager.current.name },
                    set: { new in
                        switch new {
                        case Theme.light.name:
                            deps.themeManager.set(.light)
                        case Theme.dark.name:
                            deps.themeManager.set(.dark)
                        case Theme.blackAndWhite.name:
                            deps.themeManager.set(.blackAndWhite)
                        default:
                            deps.themeManager.set(.light)
                        }
                    }
                )) {
                    Text(Theme.light.name).tag(Theme.light.name)
                    Text(Theme.dark.name).tag(Theme.dark.name)
                    Text(Theme.blackAndWhite.name).tag(Theme.blackAndWhite.name) // 👈 new
                }
                .pickerStyle(SegmentedPickerStyle())
            }
        }
    }
}
