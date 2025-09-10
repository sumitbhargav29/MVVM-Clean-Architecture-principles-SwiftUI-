//
//  AppDependencies.swift
//  MVVM-Clean-Architecture-principles-SwiftUI-
//
//  Created by Sam's Mac on 10/09/25.
//

import Foundation
import SwiftUI

enum APIServiceType: String, CaseIterable, Identifiable {
    case v1 = "V1"
    case v2 = "V2"
    
    var id: String { rawValue }
}

@MainActor
final class AppDependencies: ObservableObject {
    @Published var apiType: APIServiceType = .v1
    @Published var themeManager = ThemeManager()
    
    func apiService() -> APIService {
        switch apiType {
        case .v1: return MockAPIServiceV1()
        case .v2: return MockAPIServiceV2()
        }
    }
}
