//
//  SwiftUIView.swift
//  
//
//  Created by Swee Kwang Chua on 17/8/22.
//

import SwiftUI

public struct RUITextfield: View {
    @Binding var text: String
    
    // MARK: - Textfield
    @FocusState var isInFocus: Bool
    
    // MARK: - Textfield/Text Properties
    public var color: Color = .black
    public var font: Font = .body
    
    // MARK: - Placeholder
    public var placeholder: String
    public var placeholderColor: Color
    public var leadingPadding: CGFloat
    public var topPadding: CGFloat
    public var trailingPadding: CGFloat
    public var bottomPadding: CGFloat
    
    // MARK: - Background
    public var background: Color
    
    // MARK: - Border
    @State var borderColorState: Color
    public var borderColor: Color
    public var borderColorFocused: Color
    public var cornerRadius: CGFloat
    
    // MARK: - Eye
    @State var isVisible: Bool = false
    public var isSecure: Bool
    public var eyeColor: Color
    
    var keyboardType: UIKeyboardType = .default
    
    
    // MARK: - Actions
    public var onFocus: () -> Void = {}
    public var offFocus: () -> Void = {}
    
    // MARK: - Individual Padding
    public init(text: Binding<String>,
                color: Color = .black,
                font: Font = .body,
                placeholder: String,
                placeholderColor: Color = .gray,
                leadingPadding: CGFloat = 16,
                topPadding: CGFloat = 16,
                trailingPadding: CGFloat = 16,
                bottomPadding: CGFloat = 16,
                background: Color = .clear,
                borderColor: Color = .init(red: 220/255, green: 220/255, blue: 220/255),
                borderColorFocused: Color = .blue,
                cornerRadius: CGFloat = 8,
                isSecure: Bool = false,
                eyeColor: Color = .gray,
                keyboardType: UIKeyboardType = .default,
                onFocus: @escaping () -> Void = {},
                offFocus: @escaping () -> Void = {}
    ){
        self._text = text
        self.color = color
        self.font = font
        self.placeholder = placeholder
        self.placeholderColor = placeholderColor
        self.leadingPadding = leadingPadding
        self.topPadding = topPadding
        self.trailingPadding = trailingPadding
        self.bottomPadding = bottomPadding
        self.background = background
        self.borderColorState = borderColor
        self.borderColor = borderColor
        self.borderColorFocused = borderColorFocused
        self.cornerRadius = cornerRadius
        self.isSecure = isSecure
        self.eyeColor = eyeColor
        self.keyboardType = keyboardType
        self.onFocus = onFocus
        self.offFocus = offFocus
    }
    
    // MARK: - Shorten Padding
    public init(text: Binding<String>,
                color: Color = .black,
                font: Font = .body,
                placeholder: String,
                placeholderColor: Color = .gray,
                padding: CGFloat = 16,
                background: Color = .clear,
                borderColor: Color = .init(red: 220/255, green: 220/255, blue: 220/255),
                borderColorFocused: Color = .blue,
                cornerRadius: CGFloat = 8,
                isSecure: Bool = false,
                eyeColor: Color = .gray,
                keyboardType: UIKeyboardType = .default,
                onFocus: @escaping () -> Void = {},
                offFocus: @escaping () -> Void = {}
    ){
        self._text = text
        self.color = color
        self.font = font
        self.placeholder = placeholder
        self.placeholderColor = placeholderColor
        self.leadingPadding = padding
        self.topPadding = padding
        self.trailingPadding = padding
        self.bottomPadding = padding
        self.background = background
        self.borderColorState = borderColor
        self.borderColor = borderColor
        self.borderColorFocused = borderColorFocused
        self.cornerRadius = cornerRadius
        self.isSecure = isSecure
        self.eyeColor = eyeColor
        self.keyboardType = keyboardType
        self.onFocus = onFocus
        self.offFocus = offFocus
    }
    
    // MARK: - Hortozen Padding
    public init(text: Binding<String>,
                color: Color = .black,
                font: Font = .body,
                placeholder: String,
                placeholderColor: Color = .gray,
                horizontalPadding: CGFloat = 16,
                verticalPadding: CGFloat = 16,
                background: Color = .clear,
                borderColor: Color = .init(red: 220/255, green: 220/255, blue: 220/255),
                borderColorFocused: Color = .blue,
                cornerRadius: CGFloat = 8,
                isSecure: Bool = false,
                eyeColor: Color = .gray,
                keyboardType: UIKeyboardType = .default,
                onFocus: @escaping () -> Void = {},
                offFocus: @escaping () -> Void = {}
    ){
        self._text = text
        self.color = color
        self.font = font
        self.placeholder = placeholder
        self.placeholderColor = placeholderColor
        self.leadingPadding = horizontalPadding
        self.topPadding = verticalPadding
        self.trailingPadding = horizontalPadding
        self.bottomPadding = verticalPadding
        self.background = background
        self.borderColorState = borderColor
        self.borderColor = borderColor
        self.borderColorFocused = borderColorFocused
        self.cornerRadius = cornerRadius
        self.isSecure = isSecure
        self.eyeColor = eyeColor
        self.keyboardType = keyboardType
        self.onFocus = onFocus
        self.offFocus = offFocus
    }
    
    public var body: some View {
        ZStack {
            if (text.isEmpty) {
                HStack {
                    Text(placeholder)
                        .foregroundColor(placeholderColor)
                        .font(font)
                    Spacer()
                }
            }
            
            HStack {
                
                if (isSecure && !isVisible) {
                        SecureField("", text: $text)
                            .foregroundColor(color)
                            .font(font)
                            .focused($isInFocus)
                            .padding(1)
                            .keyboardType(keyboardType)
                        
                } else {
                        TextField("",text: $text)
                            .foregroundColor(color)
                            .font(font)
                            .focused($isInFocus)
                            .keyboardType(keyboardType)
                }
                
                Spacer()
                
                if(isSecure) {
                    Button {
                        isVisible.toggle()
                    } label: {
                        Image(systemName: isVisible ? "eye" : "eye.slash")
                            .resizable()
                            .frame(width: 22, height: 16)
                            .foregroundColor(eyeColor)
                    }
                }
                
            }
            
        }
        .padding(.leading, leadingPadding)
        .padding(.trailing, trailingPadding)
        .padding(.top, topPadding)
        .padding(.bottom, bottomPadding)
        .background(background)
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(borderColorState, lineWidth: 2)
        )
        .onChange(of: isInFocus) { isFocus in
            if isFocus {
                borderColorState = borderColorFocused
                onFocus()
            } else {
                borderColorState = borderColor
                offFocus()
            }
        }
        .onChange(of: borderColor) { newBorderColor in
            borderColorState = newBorderColor
        }
    }

}

struct RUITextfieldInnerPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        RUITextfield(text: .constant(""), placeholder: "Placeholder")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
