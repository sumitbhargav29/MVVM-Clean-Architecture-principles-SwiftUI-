//
//  Theme.swift
//  MVVM-Clean-Architecture-principles-SwiftUI-
//
//  Created by Sam's Mac on 10/09/25.
//

import Foundation

import SwiftUI

struct Theme {
    let name: String
    let background: Color
    let primaryText: Color
    let secondaryText: Color
    let accent: Color
    let cornerRadius: CGFloat
    let spacing: CGFloat
    let titleFont: Font
    let bodyFont: Font
    
    static let light = Theme(
        name: "Light",
        background: Color(.systemBackground),
        primaryText: Color(.label),
        secondaryText: Color(.secondaryLabel),
        accent: Color(.systemBlue),
        cornerRadius: 12,
        spacing: 12,
        titleFont: .title2.bold(),
        bodyFont: .body
    )
    
    static let dark = Theme(
        name: "Dark",
        background: Color(.systemGray6),
        primaryText: Color(.white),
        secondaryText: Color(.gray),
        accent: Color(.orange),
        cornerRadius: 12,
        spacing: 12,
        titleFont: .title2.bold(),
        bodyFont: .body
    )
    
    static let blackAndWhite = Theme(
        name: "Black & White",
        background: .black,                    // full black background
        primaryText: .white,                   // white text
        secondaryText: .white.opacity(0.7),    // dimmer white
        accent: .white,                        // white accent color
        cornerRadius: 0,                       // square corners for a stark look
        spacing: 12,
        titleFont: .title2.bold(),
        bodyFont: .body
    )
}
