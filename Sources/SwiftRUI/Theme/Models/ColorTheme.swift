//
//  File.swift
//  
//
//  Created by Swee Kwang Chua on 14/3/24.
//

import SwiftUI

/// A struct representing the theme for colors, designed for use within SwiftUI and your app.
public struct ColorTheme {
    public var accent: Color
    public var primary: Color
    public var secondary: Color
    public var background: Color
    public var onBackground: Color
    public var onPrimary: Color
    public var onSecondary: Color
    public var errorBackground: Color
    public var warningBackground: Color
    public var successBackground: Color
    
    /// Initializes a new theme with specified colors.
    ///
    /// - Parameters:
    ///   - accent: The color used for accenting or highlighting elements in the UI. Default is blue.
    ///   - primary: The primary color of the UI, used in major elements like headers or primary buttons. Default is indigo.
    ///   - secondary: The secondary color of the UI, used in elements of lesser importance. Default is gray.
    ///   - background: The general background color of the UI. Default is light gray.
    ///   - onBackground: The color used for text or icons on top of backgroundColor elements. Default is dark gray.
    ///   - onPrimary: The color used for text or icons on top of primaryColor elements. Default is light gray.
    ///   - onSecondary: The color used for text or icons on top of secondaryColor elements. Default is dark gray.
    ///   - errorBackground: The background color used for displaying error states or messages. Default is red.
    ///   - warningBackground: The background color used for warning states or messages. Default is yellow.
    ///   - successBackground: The background color used for success states or messages. Default is green.
    public init(
        accent: Color = .blue,
        primary: Color = .indigo,
        secondary: Color = .gray,
        background: Color = Color(uiColor: UIColor.systemGray),
        onPrimary: Color = Color(uiColor: UIColor.systemGray),
        onSecondary: Color = .gray,
        onBackground: Color = .gray,
        errorBackground: Color = .red,
        warningBackground: Color = .yellow,
        successBackground: Color = .green
    ) {
        self.accent = accent
        self.primary = primary
        self.secondary = secondary
        self.background = background
        self.onPrimary = onPrimary
        self.onSecondary = onSecondary
        self.onBackground = onBackground
        self.errorBackground = errorBackground
        self.warningBackground = warningBackground
        self.successBackground = successBackground
    }
}

