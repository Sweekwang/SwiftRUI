//
//  BasicButton.swift
//
//
//  Created by Swee Kwang Chua on 15/11/23.
//

import SwiftUI

public struct BasicButton: View {
    @Environment(\.theme) var theme: Theme
    
    var title: String
    var action: () -> Void
    
    // Text Modifier Properties
    var buttonType: ButtonType
    var customForegroundColor: Color?
    var customBackgroundColor: Color?
    var customOutlineColor: Color?
    var font: Font
    var cornerRadius: CGFloat
    var padding: RUIPadding
    var lineWidth: CGFloat
    var fullwidth: Bool
    
    public init(title: String,
                type: ButtonType = .filled,
                font: Font = .body,
                foregroundColor: Color? = nil,
                backgroundColor: Color? = nil,
                outlineColor: Color? = nil,
                cornerRadius: CGFloat = 8,
                padding: RUIPadding = RUIPadding(16),
                lineWidth: CGFloat = 1,
                fullwidth: Bool = true,
                action: @escaping () -> Void) {
        self.title = title
        self.action = action
        self.buttonType = type
        self.customForegroundColor = foregroundColor
        self.customBackgroundColor = backgroundColor
        self.customOutlineColor = outlineColor
        self.font = font
        self.cornerRadius = cornerRadius
        self.padding = padding
        self.lineWidth = lineWidth
        self.fullwidth = fullwidth
    }
    
    public var body: some View {
        Button(action: action) {
            HStack {
                if fullwidth {
                    Spacer()
                }
                
                Text(title)
                    .font(font)
                    .foregroundColor(customForegroundColor ?? theme.onPrimary)
                    .padding(.top, padding.top)
                    .padding(.trailing, padding.trailing)
                    .padding(.bottom, padding.bottom)
                    .padding(.leading, padding.leading)
                
                if fullwidth {
                    Spacer()
                }
            }
            .background(
                buttonType == .outlined ? customBackgroundColor ?? nil :
                customBackgroundColor ?? theme.primary
            )
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(customBackgroundColor ?? theme.primary, lineWidth: buttonType == .outlined ? lineWidth : 0)
            )
        }
    }
}



#Preview("Filled Button") {
    VStack(spacing: 16) {
        BasicButton(title: "Sign Up", type: .filled, cornerRadius: 30) {
            
        }
        
        BasicButton(title: "Sign Up",
                    type: .filled,
                    foregroundColor: .gray,
                    backgroundColor: Color(uiColor: UIColor.systemGray6)
        ) {
            
        }
        
        BasicButton(title: "Sign Up",
                    type: .filled,
                    foregroundColor: Color(uiColor: UIColor.systemGray6)
        ) {
            
        }
        
        BasicButton(title: "Sign Up",
                    type: .filled,
                    backgroundColor: .gray
        ) {
            
        }
        
    }
}

#Preview("Outlined Button") {
    VStack {
        BasicButton(title: "Sign Up", type: .outlined) {
            
        }
    }
}

#Preview("Plain Button") {
    BasicButton(title: "Sign Up", type: .plain) {
        
    }
}

#Preview("Disabled Button") {
    BasicButton(title: "Sign Up", type: .plain) {
        
    }
}
