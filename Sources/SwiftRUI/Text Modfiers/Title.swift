//
//  TitleText.swift
//
//
//  Created by Swee Kwang Chua on 6/1/24.
//

import SwiftUI

/// `TitleText` is a SwiftUI ViewModifier designed for consistent and customizable
/// text styling. It integrates with an app's theme system for dynamic styling
/// and supports custom font and color settings.
public struct TitleText: ViewModifier {
    @Environment(\.theme) var theme: Theme
    
    public var font: Font?
    public var foregroundColor: Color?
    
    /// Initializes a new TitleText ViewModifier with optional custom font and foreground color.
    /// - Parameters:
    ///   - font: The font to apply to the text, defaulting to `.title`.
    ///   - foregroundColor: The text color. If nil, uses the theme's default color.
    public init(
        font: Font? = nil,
        foregroundColor: Color? = nil
    ) {
        self.font = font
        self.foregroundColor = foregroundColor
    }
    
    /// Initializes with a theme type, applying appropriate foreground color.
    /// - Parameters:
    ///   - font: The font to apply to the text, defaulting to `.title`.
    ///   - themeType: The theme type determining the foreground color.
    public init(
        font: Font? = nil,
        themeType: ThemeType
    ) {
        self.font = font
        
        switch themeType {
        case .background:
            foregroundColor = theme.onBackground
        case .primary:
            foregroundColor = theme.onPrimary
        }
    }
    
    /// Applies the modifier to the content, setting font and foreground color.
    /// - Parameter content: The content to modify.
    /// - Returns: Modified view with applied font and color.
    public func body(content: Content) -> some View {
        content
            .font(font ?? theme.title)
            .foregroundColor(foregroundColor ?? theme.onBackground)
    }
}

extension View {
    /// Applies the TitleText modifier with optional custom font and color.
    /// - Parameters:
    ///   - font: The font to apply. Defaults to `.title`.
    ///   - foregroundColor: The text color. Defaults to theme's color if nil.
    /// - Returns: The modified view.
    ///
    /// Usage:
    /// Default title styling (defined by the app's theme):
    /// ```
    /// Text("Your Title")
    ///     .titleText()
    /// ```
    /// Customized styling with headline font and red color:
    /// ```
    /// Text("Your Title")
    ///     .titleText(font: .headline, foregroundColor: .red)
    /// ```
    public func titleText(font: Font? = nil,
                          foregroundColor: Color? = nil) -> some View {
        self.modifier(TitleText(font: font,
                                foregroundColor: foregroundColor))
    }
    
    /// Applies Title with onPrimary theme color.
    /// - Parameters:
    ///   - themeType: The theme type for foreground color.
    /// - Returns: The modified view.
    public func titleOnBackground(font: Font? = nil) -> some View {
        self.modifier(TitleText(font: font,
                                themeType: .background))
    }
    
    /// Applies Title with onPrimary theme color.
    /// - Parameters:
    ///   - themeType: The theme type for foreground color.
    /// - Returns: The modified view.
    public func titleOnPrimary(font: Font? = nil) -> some View {
        self.modifier(TitleText(font: font,
                                themeType: .primary))
    }
}
