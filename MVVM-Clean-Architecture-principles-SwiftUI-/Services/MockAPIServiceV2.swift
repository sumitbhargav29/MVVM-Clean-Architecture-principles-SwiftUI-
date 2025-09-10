//
//  MockAPIServiceV2.swift
//  MVVM-Clean-Architecture-principles-SwiftUI-
//
//  Created by Sam's Mac on 10/09/25.
//

import Foundation

actor MockAPIServiceV2: APIService {
    func fetchUsers() async throws -> [APIUserDTO] {
        try await Task.sleep(nanoseconds: 400_000_000)
        return [
            APIUserDTO(id: 1, name: nil, firstName: "Alice", lastName: "J.", avatarURL: nil),
            APIUserDTO(id: 2, name: nil, firstName: "Robert", lastName: "S.", avatarURL: nil)
        ]
    }
}
