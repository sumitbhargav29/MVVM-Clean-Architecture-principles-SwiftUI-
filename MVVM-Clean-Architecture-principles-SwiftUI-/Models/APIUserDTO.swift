//
//  APIUserDTO.swift
//  MVVM-Clean-Architecture-principles-SwiftUI-
//
//  Created by Sam's Mac on 10/09/25.
//

import Foundation


struct APIUserDTO: Codable, Identifiable {
    let id: Int
    let name: String?
    let firstName: String?
    let lastName: String?
    let avatarURL: String?
}
