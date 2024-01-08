//
//  SwiftUIView.swift
//  
//
//  Created by Swee Kwang Chua on 27/6/22.
//

import SwiftUI

public struct RUIRoundedCornerTextButton: View {
    public var text: String
    public var action: () -> Void
    
    // MARK: - Colors
    public var backgroundColor: Color
    public var textColor: Color
    
    // MARK: - Font
    // Font will determine the height of the view. However, user can use frame to set the height too.
    public var font: Font
    
    // MARK: - Padding Setting
    public var leadingPadding: CGFloat
    public var topPadding: CGFloat
    public var trailingPadding: CGFloat
    public var bottomPadding: CGFloat
    
    // MARK: - Outline properties only.
    public var borderColor: Color
    public var lineWidth: CGFloat
    
    // MARK: - Others
    public var cornerRadius: CGFloat
    
    // MARK: - Initializer
    /// Buttons that allows a user to take a actions by tapping it. This button contains only text in the middle. By default the button is filled. However, you can make it to outlined by changing the `backgroundColor` to `Color.clear` and `lineWidth` to any value instead of the default 0.
    /// - Parameters:
    ///   - text: value display in the middle of the text
    ///   - backgroundColor: background color of the button. Change to `Color.clear` or any color to make it outline or text only button. ( Default: Color.black )
    ///   - textColor: text color of the button. ( Default: Color.white )
    ///   - font: font. By changing the font size, the height will also increase or decrease accordingly to the font size. ( Default: Font.body )
    ///   - leadingPadding: leading padding of the text label. The space between the text and the button. ( Default: 12 )
    ///   - topPadding: top padding of the text label. The space between the text and the button. ( Default: 12 )
    ///   - trailingPadding: trailing padding of the text label. The space between the text and the button. ( Default: 12 )
    ///   - bottomPadding: bottom padding of the text label. The space between the text and the button. ( Default: 12 )
    ///   - cornerRadius: corner radius of the button. ( Default: 8 )
    ///   - borderColor: outline color. ( Default: Color.black )
    ///   - lineWidth: border width. ( Default: 0 )
    ///   - action: a closure that will be called when user clicked on it.
    public init(text: String,
                backgroundColor: Color = .black,
                textColor: Color = .white,
                font: Font = .body,
                leadingPadding: CGFloat = 12,
                topPadding: CGFloat = 12,
                trailingPadding: CGFloat = 12,
                bottomPadding: CGFloat = 12,
                cornerRadius: CGFloat = 8,
                borderColor: Color = .black,
                lineWidth: CGFloat = 0,
                action: @escaping () -> Void
    ) {
        self.text = text
        self.action = action
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.font = font
        self.leadingPadding = leadingPadding
        self.topPadding = topPadding
        self.trailingPadding = trailingPadding
        self.lineWidth = lineWidth
        self.borderColor = borderColor
        self.bottomPadding = bottomPadding
        self.cornerRadius = cornerRadius
    }
    
    // MARK: - Body
    public var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Spacer()
                Text(text)
                    .font(font)
                    .foregroundColor(textColor)
                Spacer()
            }
            .padding(.leading, leadingPadding)
            .padding(.top, topPadding)
            .padding(.trailing, trailingPadding)
            .padding(.bottom, bottomPadding)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: lineWidth)
            )
        }
    }
}

struct Previews_RUIRoundedCornerTextButton_LibraryContent: LibraryContentProvider {
    var views: [LibraryItem] {
        LibraryItem(
            RUIRoundedCornerTextButton(text: "text", action: { }),
            title: "Rounded Corner Text Button",
            category: .control
        )
    }
}
