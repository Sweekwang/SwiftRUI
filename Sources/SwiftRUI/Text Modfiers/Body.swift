//
//  Body.swift
//
//
//  Created by Swee Kwang Chua on 6/1/24.
//

import SwiftUI

/// `BodyText` is a SwiftUI ViewModifier designed for consistent and customizable
/// text styling. It integrates with an app's theme system for Body font
/// and supports custom font and color settings.
public struct BodyText: ViewModifier {
    @Environment(\.theme) var theme: Theme
    
    public var font: Font?
    public var foregroundColor: Color?
    
    /// Initializes a new BodyText ViewModifier with optional custom font and foreground color.
    /// - Parameters:
    ///   - font: If nil, the font to apply to the text, defaulting body from Theme Environment..
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
    ///   - font: If nil, the font to apply to the text, defaulting body from Theme Environment..
    ///   - themeType: The theme type determining the foreground color.
    public init(
        font: Font? = nil,
        themeType: ThemeType
    ) {
        self.font = font
        
        switch themeType {
        case .background:
            foregroundColor = theme.colors.onBackground
        case .primary:
            foregroundColor = theme.colors.onPrimary
        }
    }
    
    /// Applies the modifier to the content, setting font and foreground color.
    /// - Parameter content: The content to modify.
    /// - Returns: Modified view with applied font and color.
    public func body(content: Content) -> some View {
        content
            .font(font ?? theme.fonts.body)
            .foregroundColor(foregroundColor ?? theme.colors.onBackground)
    }
}

extension View {
    /// Applies the body modifier with optional custom font and color.
    /// - Parameters:
    ///   - font: If nil, the font to apply to the text, defaulting body from Theme Environment..
    ///   - foregroundColor: The text color. Defaults to theme's color if nil.
    /// - Returns: The modified view.
    ///
    /// Usage:
    /// Default title styling (defined by the app's theme):
    ///
    /// ```
    /// Text("Your Title")
    ///     .body()
    /// ```
    /// Customized styling with headline font and red color:
    /// ```
    /// Text("Your Title")
    ///     .body(font: .headline, foregroundColor: .red)
    /// ```
    public func body(font: Font? = nil,
                          foregroundColor: Color? = nil) -> some View {
        self.modifier(BodyText(font: font,
                                foregroundColor: foregroundColor))
    }
    
    /// Applies Body with onPrimary theme color.
    /// - Parameters:
    ///   - themeType: The theme type for foreground color.
    /// - Returns: The modified view.
    public func bodyOnBackground(font: Font? = nil) -> some View {
        self.modifier(BodyText(font: font,
                                themeType: .background))
    }
    
    /// Applies Body with onPrimary theme color.
    /// - Parameters:
    ///   - themeType: The theme type for foreground color.
    /// - Returns: The modified view.
    public func bodyOnPrimary(font: Font? = nil) -> some View {
        self.modifier(BodyText(font: font,
                                themeType: .primary))
    }
}
