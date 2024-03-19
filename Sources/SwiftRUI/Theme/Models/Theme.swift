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
    
    public var colors: ColorTheme
    public var fonts: FontTheme
    

    public init(
        colors: ColorTheme = ColorTheme(),
        fonts: FontTheme = FontTheme()
    ) {
        self.colors = colors
        self.fonts = fonts
    }
}

