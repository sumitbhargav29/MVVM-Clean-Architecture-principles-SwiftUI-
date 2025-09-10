//
//  ThemeManager.swift
//  MVVM-Clean-Architecture-principles-SwiftUI-
//
//  Created by Sam's Mac on 10/09/25.
//

import Foundation

import SwiftUI

final class ThemeManager: ObservableObject {
    @Published var current: Theme = .light

    func set(_ theme: Theme) {
        withAnimation { current = theme }
    }
}
