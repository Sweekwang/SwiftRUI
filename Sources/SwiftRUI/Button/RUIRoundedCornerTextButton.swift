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
    
    // MARK: - Others
    public var cornerRadius: CGFloat
    
    // MARK: - Initializer
    public init(text: String,
                backgroundColor: Color = .black,
                textColor: Color = .white,
                font: Font = .body,
                leadingPadding: CGFloat = 12,
                topPadding: CGFloat = 12,
                trailingPadding: CGFloat = 12,
                bottomPadding: CGFloat = 12,
                cornerRadius: CGFloat = 8,
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
        }
    }
}
