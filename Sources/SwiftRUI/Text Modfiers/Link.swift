//
//  Link.swift
//
//
//  Created by Swee Kwang Chua on 6/1/24.
//

import SwiftUI

/// `LinkText` is a SwiftUI ViewModifier designed for consistent and customizable
/// text styling. It integrates with an app's theme system for headlin font
/// and supports custom font and color settings.
public struct LinkText: ViewModifier {
    @Environment(\.theme) var theme: Theme
    
    public var font: Font?
    public var foregroundColor: Color?
    
    /// Initializes a new BodyText ViewModifier with optional custom font and foreground color.
    /// - Parameters:
    ///   - font: If nil, the font to apply to the text, defaulting link from Theme Environment..
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
    ///   - font: If nil, the font to apply to the text, defaulting link from Theme Environment..
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
            .font(font ?? theme.link)
            .foregroundColor(foregroundColor ?? theme.onBackground)
    }
}

extension View {
    /// Applies the link modifier with optional custom font and color.
    /// - Parameters:
    ///   - font: If nil, the font to apply to the text, defaulting link from Theme Environment..
    ///   - foregroundColor: The text color. Defaults to theme's color if nil.
    /// - Returns: The modified view.
    ///
    /// Usage:
    /// Default title styling (defined by the app's theme):
    ///
    /// ```
    /// Text("Your Title")
    ///     .link()
    /// ```
    /// Customized styling with headline font and red color:
    /// ```
    /// Text("Your Title")
    ///     .link(font: .headline, foregroundColor: .red)
    /// ```
    public func link(font: Font? = nil,
                          foregroundColor: Color? = nil) -> some View {
        self.modifier(LinkText(font: font,
                                foregroundColor: foregroundColor))
    }
    
    /// Applies headline with onPrimary theme color.
    /// - Parameters:
    ///   - themeType: The theme type for foreground color.
    /// - Returns: The modified view.
    public func linkOnBackground(font: Font? = nil) -> some View {
        self.modifier(LinkText(font: font,
                                themeType: .background))
    }
    
    /// Applies headline with onPrimary theme color.
    /// - Parameters:
    ///   - themeType: The theme type for foreground color.
    /// - Returns: The modified view.
    public func linkOnPrimary(font: Font? = nil) -> some View {
        self.modifier(LinkText(font: font,
                                themeType: .primary))
    }
}
