//
//  SwiftUIView.swift
//  
//
//  Created by Swee Kwang Chua on 16/8/22.
//

import SwiftUI

public struct RUIRoundedCornerImageButton: View {
    public var image: Image
    public var action: () -> Void
    
    // MARK: - Type
    public var buttonType: RUIButtonType
    
    // MARK: - Image properties
    public var imageWidth: CGFloat
    public var imageHeight: CGFloat
    
    // MARK: - Colors
    public var backgroundColor: Color
    public var foregroundColor: Color
    
    // MARK: - Font
    // Font will determine the height of the view. However, user can use frame to set the height too.
    public var font: Font
    
    // MARK: - Padding Setting
    public var height: CGFloat
    public var width: CGFloat
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
    public init(image: Image,
                type: RUIButtonType = .filled,
                backgroundColor: Color = .black,
                foregroundColor: Color = .white,
                font: Font = .body,
                imageWidth: CGFloat = 24,
                imageHeight: CGFloat = 24,
                width: CGFloat = .infinity,
                height: CGFloat = 44,
                leadingPadding: CGFloat = 8,
                topPadding: CGFloat = 8,
                trailingPadding: CGFloat = 8,
                bottomPadding: CGFloat = 8,
                cornerRadius: CGFloat = 8,
                borderColor: Color = .black,
                lineWidth: CGFloat = 2,
                action: @escaping () -> Void
    ) {
        self.image = image
        self.buttonType = type
        self.action = action
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.font = font
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
        self.width = width
        self.height = height
        self.leadingPadding = leadingPadding
        self.topPadding = topPadding
        self.trailingPadding = trailingPadding
        self.lineWidth = lineWidth
        self.borderColor = borderColor
        self.bottomPadding = bottomPadding
        self.cornerRadius = cornerRadius
        
        if buttonType == .filled {
            self.lineWidth = 0
        }
        
        if buttonType == .outlined {
            self.backgroundColor = .clear
        }
    }
    
    // MARK: - Body
    public var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    image
                        .resizable()
                        .frame(
                            minWidth: 0,
                            maxWidth: imageWidth,
                            minHeight: 0,
                            maxHeight: imageWidth,
                            alignment: .center
                        )
                        .scaledToFit()
                        .foregroundColor(foregroundColor)
                    Spacer()
                }
                Spacer()
            }
        }
        .frame(
            minWidth: 0,
            maxWidth: width,
            minHeight: 0,
            maxHeight: height,
            alignment: .center
        )
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

struct RUIRoundedCornerImageButton_Previews: PreviewProvider {
    static var previews: some View {
        RUIRoundedCornerImageButton(image: Image(systemName: "trash"), action: { })
            .padding()
            .background(.white)
            .previewLayout(.sizeThatFits)
    }
}



struct Previews_RUIRoundedCornerImageButton_LibraryContent: LibraryContentProvider {
    var views: [LibraryItem] {
        LibraryItem(
            RUIRoundedCornerImageButton(image: Image(systemName: "trash"), action: { }),
            title: "Rounded Corner Image Button",
            category: .control
        )
    }
}
