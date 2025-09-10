//
//  APIUserMapper.swift
//  MVVM-Clean-Architecture-principles-SwiftUI-
//
//  Created by Sam's Mac on 10/09/25.
//

import Foundation

struct APIUserMapper {
    static func map(_ dto: APIUserDTO) -> User {
        let displayName: String
        if let name = dto.name, !name.isEmpty {
            displayName = name
        } else {
            let joined = [dto.firstName, dto.lastName].compactMap { $0 }.joined(separator: " ")
            displayName = joined.isEmpty ? "Unknown" : joined
        }
        let url = URL(string: dto.avatarURL ?? "")
        return User(id: dto.id, displayName: displayName, avatarURL: url)
    }
}

