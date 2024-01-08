//
//  File.swift
//  
//
//  Created by Swee Kwang Chua on 17/4/23.
//

import SwiftUI



/// Using RUIRoundedCornerIconButtonStyle to create button with rounded corner. By default, the border radius is `4`.
/// RUIRoundedCornerButtonStyle also let you to add `leadingIcon` and/or `trailingIcons`. You can modify
/// the style by changing the properties of the RUIRoundedCornerIconButtonStyle. The properties `leadingIcon` and/or `trailingIcons`
/// accpets any view which allows you to custimize it.
///
/// Example Rounded Corner Button with leading icons.
///```
/// Button("Import") {
///     print("Hello WOrld")
/// }
/// .lineLimit(1)
/// .buttonStyle(
///     RUIRoundedCornerButtonStyle(
///         leadingIcon: {
///             Image(systemName: "folder.badge.plus")
///                 .resizable()
///                 .aspectRatio(contentMode: .fit)
///                 .foregroundColor(.white)
///                 .frame(width: 22, height: 22)
///                 .padding(.trailing, 4)
///         }
///    )
/// )
/// ```
public struct RUIRoundedCornerIconButtonStyle<Content: View>: ButtonStyle {

    // MARK: - Font
    // Font will determine the height of the view. However, user can use frame to set the height too.
    public var textColor: Color
    public var font: Font
    
    // MARK: - Leading Icon
    @ViewBuilder public let leadingIcon: (() -> Content)?
    
    // MARK: - Trailing Icons
    @ViewBuilder public let trailingIcon: (() -> Content)?
    
    // MARK: - Button Properties
    public var backgroundColor: Color
    public var borderColor: Color
    public var lineWidth: CGFloat
    
    public var leadingPadding: CGFloat
    public var topPadding: CGFloat
    public var trailingPadding: CGFloat
    public var bottomPadding: CGFloat
    
    public var cornerRadius: CGFloat
    
    @State var isButtonTrigger = false
    
    public init(textColor: Color = .white,
                font: Font = .body,
                leadingIcon:  (() -> Content)? = nil,
                trailingIcon:  (() -> Content)? = nil,
                backgroundColor: Color = .black,
                borderColor: Color = .black,
                lineWidth: CGFloat = 1.0,
                padding: RUIPadding = RUIPadding(vertical: 12, horizontal: 16),
                cornerRadius: CGFloat = 4) {
        self.textColor = textColor
        self.font = font
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.lineWidth = lineWidth
        self.leadingPadding = padding.leading
        self.topPadding = padding.top
        self.trailingPadding = padding.trailing
        self.bottomPadding = padding.bottom
        self.cornerRadius = cornerRadius
        self.isButtonTrigger = isButtonTrigger
    }
    
    
    
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            
            Spacer()
            
            if let leadingIcon = leadingIcon {
                leadingIcon()
            }
            
            configuration.label
                .font(font)
                .foregroundColor(textColor)
            
            
            if let trailingIcon = trailingIcon {
                trailingIcon()
            }
            
            Spacer()
        }
        .padding(.leading, leadingPadding)
        .padding(.top, topPadding)
        .padding(.trailing, trailingPadding)
        .padding(.bottom, bottomPadding)
        .background(backgroundColor)
        .cornerRadius(cornerRadius)
        .opacity(configuration.isPressed ? 0.5 : 1)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(borderColor, lineWidth: lineWidth)
        )
    }
}
