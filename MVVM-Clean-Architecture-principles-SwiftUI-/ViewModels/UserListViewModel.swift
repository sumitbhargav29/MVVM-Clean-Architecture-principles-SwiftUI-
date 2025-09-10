//
//  UserListViewModel.swift
//  MVVM-Clean-Architecture-principles-SwiftUI-
//
//  Created by Sam's Mac on 10/09/25.
//

import Foundation

@MainActor
final class UserListViewModel: ObservableObject {
    @Published private(set) var users: [User] = []
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage: String?

    private let serviceProvider: () -> APIService

    init(serviceProvider: @escaping () -> APIService) {
        self.serviceProvider = serviceProvider
    }

    func load() async {
        isLoading = true
        errorMessage = nil
        do {
            let dtos = try await serviceProvider().fetchUsers()
            users = dtos.map(APIUserMapper.map)
        } catch {
            errorMessage = "Failed: \(error.localizedDescription)"
        }
        isLoading = false
    }
}
