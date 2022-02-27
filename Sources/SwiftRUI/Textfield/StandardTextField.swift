//
//  SwiftUIView.swift
//  
//
//  Created by Swee Kwang Chua on 18/7/22.
//

import SwiftUI

/// A control that displays an editable text interface with a title at the top of the textfield. This can also turn into a secure textfield which the user securely enters private text. There is a title shown on the top of the textfield and a rounded border surrouding the textfield. An eye image to switch between secure textfield and not secure textfield if isSecure is true.
//public struct StandardTextField: View {
//    public var isSecure: Bool
//
//    // MARK: - Title Properties
//    public var title: String = "Password"
//    public var titleColor: Color = .black
//    public var titleFont: Font = .body
//
//    // MARK: - TextField Properties
//    @Binding public var text: String
//    public var placeholder: String = "Enter you password"
//
//    public var keyboardType: UIKeyboardType = .default
//
//    public var textColor: Color = .black
//    public var textfieldFont: Font = .body
//
//    public let leading: CGFloat = 16
//    public let top: CGFloat = 12
//    public let trailing: CGFloat = 16
//    public let bottom: CGFloat = 12
//
//    // MARK: - Container
//    public var borderColor: Color = .gray
//    public var backgroundColor: Color = .white
//
//    // MARK: - Secure textfield
//    @State public var isHidden = true // NOT IN INITIALIZER
//
//    // MARK: - Between Text Textfield
//    public let titleToTextfieldSpacing: CGFloat = 8
//    public let eyeIconSpacing: CGFloat = 4
//
//    // MARK: - Initializer
//    /// A control that displays an editable text interface with a title at the top of the textfield and border surrouding it. There is also a placeholder to guide users on what text they should provide.
//    /// - Parameters:
//    ///   - title: The text that is shown on the top of the placeholder.
//    ///   - text: The actual value the user enter or the initial value to start of with.
//    ///   - placeholder: A descriptive text to guide users on what text they should provide.
//    ///   - isSecure: If this is true, a secure textfield is used.
//    ///   - keyboardType: Constants that specify the type of keyboard to display for a text-based view.
//    public init(title: String,
//         text: Binding<String>,
//         placeholder: String,
//         isSecure: Bool = false,
//         keyboardType: UIKeyboardType = .default) {
//        self.title = title
//        self._text = text
//        self.placeholder = placeholder
//        self.keyboardType = keyboardType
//        self.isSecure = isSecure
//    }
//
//    /// A control that displays an editable text interface with a title at the top of the textfield and border surrouding it. There is also a placeholder to guide users on what text they should provide. This allows you to change the color of the different field.
//    /// - Parameters:
//    ///   - title: The text that is shown on the top of the placeholder.
//    ///   - text: The actual value the user enter or the initial value to start of with.
//    ///   - placeholder: A descriptive text to guide users on what text they should provide.
//    ///   - isSecure: If this is true, a secure textfield is used.
//    ///   - keyboardType: Constants that specify the type of keyboard to display for a
//    ///   - titleColor: The title text color
//    ///   - textColor: The text color that the user enter
//    ///   - backgroundColor: The background color of the textfield
//    ///   - borderColor: The border color of the textfield
//    public init(title: String,
//         text: Binding<String>,
//         placeholder: String,
//         isSecure: Bool = false,
//         keyboardType: UIKeyboardType = .default,
//         titleColor: Color = .black,
//         titleFont: Font = .body,
//         textColor: Color = .black,
//         textfieldFont: Font = .body,
//         backgroundColor: Color = .white,
//         borderColor: Color = .gray
//    ) {
//        self.title = title
//        self._text = text
//        self.placeholder = placeholder
//        self.isSecure = isSecure
//        self.keyboardType = keyboardType
//        self.titleColor = titleColor
//        self.titleFont = titleFont
//        self.textColor = textColor
//        self.textfieldFont = textfieldFont
//        self.backgroundColor = textColor
//        self.backgroundColor = backgroundColor
//        self.borderColor = borderColor
//    }
//
//    // TODO: - ADD PADDING ADJUSTMENT
//
//
//    // MARK: - Body
//    public var body: some View {
//        HStack {
//            VStack(alignment: .leading, spacing: titleToTextfieldSpacing) {
//                // MARK: - TITLE
//                Text(title)
//                    .foregroundColor(titleColor)
//                    .font(titleFont)
//
//                HStack {
//                    // MARK: - Textfield
//                    Group{
//                        if (isSecure && isHidden) {
//                            SecureField(placeholder, text: $text)
//                        } else {
//                            TextField(placeholder, text: $text)
//                        }
//                    }
//                    .font(textfieldFont)
//                    .foregroundColor(textColor)
//                    .keyboardType(keyboardType)
//
//                    // MARK: - EYE IMAGE
//                    if (isSecure) {
//                        Button {
//                            isHidden.toggle()
//                        } label: {
//                            Image(systemName: isHidden ? "eye.fill" : "eye.slash.fill")
//                                .frame(width: 20, height: 26)
//                                .foregroundColor(.black)
//                                .scaledToFit()
//                                .padding(.trailing, trailing)
//                        }
//                    }
//                } //: HStack
//                .padding(.leading, leading)
//                .padding(.top, top)
//                .padding(.bottom, bottom)
//                .padding(.trailing, eyeIconSpacing)
//                .background(backgroundColor)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 4)
//                        .stroke(borderColor)
//                )
//
//            } //: VStack
//
//        } //: HStack
//    } //: Body
//}
