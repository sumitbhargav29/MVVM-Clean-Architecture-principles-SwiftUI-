//
//  APIService.swift
//  MVVM-Clean-Architecture-principles-SwiftUI-
//
//  Created by Sam's Mac on 10/09/25.
//

import Foundation


protocol APIService {
    func fetchUsers() async throws -> [APIUserDTO]
}


