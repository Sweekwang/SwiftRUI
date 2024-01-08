//
//  SwiftUIView.swift
//  
//
//  Created by Swee Kwang Chua on 4/12/22.
//

import SwiftUI

struct RUIButton: View {
    // MARK: - Button
    public var text: String
    public var textColor: Color
    public var textFont: Font
    public var background: Color
    public var padding: RUIPadding
    public var cornerRadius: CGFloat
    
    // MARK: - Outline
    // TODO: Outline layout
    
    // MARK: - Leading Icon
    public var leadingIcon: Image? = Image(systemName: "plus")
    public var leadingForegroundColor: Color // Only useful for SFSymbols
    public var leadingIconFrame: RUIFrame?
    public var leadingIconFont: Font // Only useful for SFSymbols
    
    // MARK: - Trailing Icon
    public var trailingIcon: Image?
    public var trailingIconFrame: RUIFrame?
    public var trailingForegroundColor: Color // Only useful for SFSymbols
    public var trailingIconFont: Font // Only useful for SFSymbols
    
    // MARK: - State
    // TODO: Handle Disable State
    
    // MARK: - Button Clicked Action
    public var action: () -> Void
    
    // MARK: - Initializer
    public init(
        text: String,
        textColor: Color = Color.white,
        textFont: Font = .body,
        background: Color = Color.blue,
        cornerRadius: CGFloat = 6,
        padding: RUIPadding = RUIPadding(12),
        leadingIcon: Image? = nil,
        leadingIconFrame: RUIFrame? = nil,
        leadingForegroundColor: Color = Color.white,
        leadingIconFont: Font = .body,
        trailingIcon: Image? = nil,
        trailingIconFrame: RUIFrame? = nil,
        trailingForegroundColor: Color = Color.white,
        trailingIconFont: Font = .body,
        action: @escaping () -> Void) {
            self.text = text
            self.textColor = textColor
            self.textFont = textFont
            self.background = background
            self.cornerRadius = cornerRadius
            self.padding = padding
            
            self.leadingIcon = leadingIcon
            self.leadingIconFrame = leadingIconFrame
            self.leadingForegroundColor = leadingForegroundColor
            self.leadingIconFont = leadingIconFont
            
            self.trailingIcon = trailingIcon
            self.trailingIconFrame = trailingIconFrame
            self.trailingForegroundColor = trailingForegroundColor
            self.trailingIconFont = trailingIconFont
            
            self.action = action
        }
    
    // MARK: - View
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Spacer()
                
                if let leadingIcon = leadingIcon {
                    if let leadingIconFrame = leadingIconFrame {
                        leadingIcon
                            .resizable()
                            .frame(width: 20, height: leadingIconFrame.height)
                            .foregroundColor(leadingForegroundColor)
                    } else {
                        // Icon for SFSymbols
                        leadingIcon
                            .foregroundColor(leadingForegroundColor)
                            .font(leadingIconFont)
                    }
                }
                
                Text(text)
                    .foregroundColor(textColor)
                    .font(textFont)
                
                if let trailingIcon = trailingIcon {
                    if let trailingIconFrame = trailingIconFrame {
                        trailingIcon
                            .resizable()
                            .frame(width: trailingIconFrame.width, height: trailingIconFrame.height)
                            .foregroundColor(trailingForegroundColor)
                    } else {
                        // Icon for SFSymbols
                        trailingIcon
                            .foregroundColor(trailingForegroundColor)
                            .font(trailingIconFont)
                    }
                }
                
                Spacer()
            }
            .padding(.top, padding.top)
            .padding(.trailing, padding.trailing)
            .padding(.bottom, padding.bottom)
            .padding(.leading, padding.leading)
            .background(background)
            .cornerRadius(cornerRadius)
        }
        
    }
}

struct RUIButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RUIButton(text: "Button", action: { })
                .padding()
                .previewLayout(.sizeThatFits)
                .previewDisplayName("Text Button")
            
            RUIButton(
                text: "Button",
                leadingIcon: Image(systemName: "plus"),
                action: { })
                .padding()
                .previewLayout(.sizeThatFits)
                .previewDisplayName("Leading Icon Button")
            
            RUIButton(
                text: "Button",
                trailingIcon: Image(systemName: "plus"),
                action: { })
                .padding()
                .previewLayout(.sizeThatFits)
                .previewDisplayName("Trailing Icon Button")
            
            RUIButton(
                text: "Button 2",
                leadingIcon: Image("binoculars"),
                leadingIconFrame: (20,20),
                action: { })
                .padding()
                .previewLayout(.sizeThatFits)
                .previewDisplayName("Leading Icon Button Non System")
        }
    }
}

struct Previews_RUIButton_LibraryContent: LibraryContentProvider {
    var views: [LibraryItem] {
        LibraryItem(
            RUIButton(text: "Button") {} ,
            title: "RUI Button",
            category: .control
        )
    }
}
