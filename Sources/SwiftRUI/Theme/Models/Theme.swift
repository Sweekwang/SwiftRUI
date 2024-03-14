//
//  File.swift
//
//
//  Created by Swee Kwang Chua on 4/12/22.
//

import SwiftUI

/// `Theme` struct is used to define a cohesive color scheme for the user interface of a SwiftUI application.
/// It encompasses various colors for different UI elements and states.
///
/// # Changing Theme
/// You can easily apply your custom theme to your entire application or specific components. Declare the
/// custom theme at the top level of your app using `.environment`.
///
/// ```
/// import SwiftUI
///
/// @main
/// struct MyApp: App {
///     var body: some Scene {
///         WindowGroup {
///             ContentView()
///                 .environment(\.theme, Theme(accent: .red, primary: .blue, secondary: .yellow))
///         }
///     }
/// }
/// ```
///
/// # Using Theme in Your Components
/// To use this theme within your application, access the theme environment variable and apply its properties directly.
/// ```
///  @Environment(\.theme) var theme: Theme
///
///  ...
///     .foregroundColor(theme.primary)
///  ...
/// ```
public struct Theme {
    
    /// A default theme instance with predefined colors.
    public static let `default` = Theme()
    
    /// Initializes a new theme with specified colors.
    /// Note: The default colors provided are placeholders and are subject to change in the near future.
    /// It is advisable to customize these colors to align with your app's specific branding and design guidelines.
    /// Please be prepared to adjust your color scheme accordingly when these changes occur.
    ///
    /// - Parameters:
    ///   - accent: The color used for accenting or highlighting elements in the UI. Default is teal.
    ///   - primary: The primary color of the UI, used in major elements like headers or primary buttons. Default is indigo.
    ///   - secondary: The secondary color of the UI, used in elements of lesser importance. Default is gray.
    ///   - background: The general background color of the UI. Default is light gray.
    ///   - onBackground: The color used for text or icons on top of backgroundColor elements. Default is dark gray.
    ///   - onPrimary: The color used for text or icons on top of primaryColor elements. Default is light gray.
    ///   - onSecondary: The color used for text or icons on top of secondaryColor elements. Default is dark gray.
    ///   - errorBackground: The background color used for displaying error states or messages. Default is red.
    ///   - warningBackground: The background color used for warning states or messages. Default is yellow.
    ///   - successBackground: The background color used for success states or messages. Default is green.
    ///   - title: The default font for titles. Default is .title.
    ///   - headline: The default font for headlines. Default is .headline.
    ///   - subhead: The default font for subheadings. Default is .subheadline.
    ///   - body: The default font for body text. Default is .body.
    ///   - label: The default font for labels. Default is .footnote.
    ///   - callout: The default font for callouts. Default is .callout.
    ///   - link: The default font for links. Default is .body.
    public init(
        accent: Color = .teal,
        primary: Color = .indigo,
        secondary: Color = .gray,
        background: Color = Color(uiColor: UIColor.systemGray),
        onPrimary: Color = Color(uiColor: UIColor.systemGray),
        onSecondary: Color = .gray,
        onBackground: Color = .gray,
        errorBackground: Color = .red,
        warningBackground: Color = .yellow,
        successBackground: Color = .green,
        title: Font = .title,
        headline: Font = .headline,
        subhead: Font = .subheadline,
        body: Font = .body,
        label: Font = .footnote,
        callout: Font = .callout,
        link: Font = .body
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
        
        self.title = title
        self.headline = headline
        self.subhead = subhead
        self.body = body
        self.label = label
        self.callout = callout
        self.link = link
    }
    
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
    
    public var title: Font
    public var headline: Font
    public var subhead: Font
    public var body: Font
    public var label: Font
    public var callout: Font
    public var link: Font
}

