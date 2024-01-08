//
//  View+Theme.swift
//
//
//  Created by Swee Kwang Chua on 8/1/24.
//

import SwiftUI

extension View {
    /// Applies the specified theme to the environment of the view.
    /// - Parameter theme: The `Theme` instance to apply.
    /// - Returns: A view with the theme applied to its environment.
    public func applyThemeEnvironment(_ theme: Theme) -> some View {
        self.environment(\.theme, theme)
    }
}
