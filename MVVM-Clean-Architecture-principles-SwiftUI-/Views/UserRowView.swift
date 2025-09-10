//
//  UserRowView.swift
//  MVVM-Clean-Architecture-principles-SwiftUI-
//
//  Created by Sam's Mac on 10/09/25.
//

import Foundation
import SwiftUI

struct UserRowView: View {
    let user: User
    @EnvironmentObject var deps: AppDependencies

    var body: some View {
        HStack(spacing: deps.themeManager.current.spacing) {
            Circle()
                .fill(deps.themeManager.current.accent.opacity(0.25))
                .frame(width: 44, height: 44)
                .overlay(
                    Text(user.displayName.prefix(1))
                        .font(.headline)
                        .foregroundColor(deps.themeManager.current.primaryText)
                )

            VStack(alignment: .leading, spacing: 6) {
                Text(user.displayName)
                    .font(deps.themeManager.current.titleFont)
                    .foregroundColor(deps.themeManager.current.primaryText)
                Text("ID: \(user.id)")
                    .font(deps.themeManager.current.bodyFont)
                    .foregroundColor(deps.themeManager.current.secondaryText)
            }
            Spacer()
        }
        .padding(deps.themeManager.current.spacing)
        .background(
            RoundedRectangle(cornerRadius: deps.themeManager.current.cornerRadius)
                .fill(deps.themeManager.current.background.opacity(0.5))
        )
    }
}
