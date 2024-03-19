//
//  SwiftUIView.swift
//
//
//  Created by Swee Kwang Chua on 14/3/24.
//

import SwiftUI


/// The Typography view is a flexible component designed to streamline the use of fonts
/// across your SwiftUI application. It leverages a Theme provided through SwiftUI's
/// environment to apply consistent font styles. This approach offers an elegant solution
/// to applying font styles without hardcoding font details throughout your app.
///
///
/// The Typography view allows for text presentation with two primary customization paths:
/// 1. **By TextStyle:** Utilizes predefined styles from the Theme environment object.
/// This method is beneficial for maintaining consistency and simplifying theme adjustments.
/// 2. **By Custom Font:** Allows for explicit font specification, bypassing the theme's 
/// typography system. This method offers flexibility for exceptional cases where the predefined
/// styles do not meet requirements.
///
/// ## Initialization
/// The Typography view can be initialized in one of two ways:
/// 1. Using TextStyle:
/// This initializer sets the text to be displayed and applies a font style defined by the TextStyle enum.
///
/// ```
/// Typography("Hello, world!", style: .title1)
/// ```
/// 2. Using a Custom Font:
///  This initializer sets the text to be displayed and applies a custom font directly.
/// ```
/// Typography("This is a custom font text.", font: .custom("Helvetica Neue", size: 16))
/// ```
public struct Typography: View {
    // This property wrapper fetches the current theme from the SwiftUI environment, providing access to the theme's fonts.
    @Environment(\.theme) var theme: Theme
    
    var text: String
    var style: TextStyle?
    var customFont: Font?
    
    /// This initializer sets the text to be displayed and applies a font style defined by the TextStyle enum.
    public init(_ text: String, style: TextStyle = .body) {
        self.text = text
        self.style = style
        self.customFont = nil
    }
    
    /// This initializer sets the text to be displayed and applies a custom font directly.
    public init(_ text: String, font: Font) {
        self.text = text
        self.customFont = font
        self.style = nil
    }
    
    public var body: some View {
        /// Determines the font to use based on the presence of a style or customFont. It then displays the text with the selected font.
        let font: Font = {
            if let style = style {
                return setupFont(for: style)
            }
            
            return customFont!
        }()
        
        Text(text)
            .font(font)
    }
}

extension Typography {
    func setupFont(for style: TextStyle) -> Font{
        switch style {
        case .title1:
            return theme.fonts.title1
        case .title2:
            return theme.fonts.title2
        case .title3:
            return theme.fonts.title3
        case .heading1:
            return theme.fonts.heading1
        case .heading2:
            return theme.fonts.heading2
        case .heading3:
            return theme.fonts.heading3
        case .subheading1:
            return theme.fonts.subheading1
        case .subheading2:
            return theme.fonts.subheading2
        case .subheading3:
            return theme.fonts.subheading3
        case .body:
            return theme.fonts.body
        case .label:
            return theme.fonts.label
        case .callout:
            return theme.fonts.callout
        }
    }
}

#Preview {
    Typography("Typography")
}
