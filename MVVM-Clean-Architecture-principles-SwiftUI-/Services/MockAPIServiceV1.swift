//
//  MockAPIServiceV1.swift
//  MVVM-Clean-Architecture-principles-SwiftUI-
//
//  Created by Sam's Mac on 10/09/25.
//

import Foundation


actor MockAPIServiceV1: APIService {
    func fetchUsers() async throws -> [APIUserDTO] {
        try await Task.sleep(nanoseconds: 600_000_000)
        return [
            APIUserDTO(id: 1, name: "Alice Johnson", firstName: nil, lastName: nil, avatarURL: nil),
            APIUserDTO(id: 2, name: "Bob Smith", firstName: nil, lastName: nil, avatarURL: nil)
        ]
    }
}

