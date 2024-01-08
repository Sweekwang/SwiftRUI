//
//  File.swift
//  
//
//  Created by Swee Kwang Chua on 6/5/23.
//

import SwiftUI

/// RoundedCornerButtonStyle conforms to `ButtoneStyle` which creates a button that covered
/// the whole width available with a deafult `blue` background and a `cornerRadius` of `4`.
///
/// ```
/// Button {
///     isLoading.toggle()
/// } label: {
///     Text("Text")
///         .foregroundColor(.white)
/// }
/// .buttonStyle(
///     RoundedCornerButtonStyle(isLoading: $isLoading)
/// )
/// ```
public struct RoundedCornerButtonStyle: ButtonStyle {
    /// Properties are arrange from general styling such as background to specific states properties
    /// changes such as loading, disabled status.
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    // MARK: - Button Properties
    var isFullWidth: Bool
    var backgroundColor: Color
    var borderColor: Color
    var lineWidth: CGFloat
    
    var leadingPadding: CGFloat
    var topPadding: CGFloat
    var trailingPadding: CGFloat
    var bottomPadding: CGFloat
    
    var cornerRadius: CGFloat
    
    // MARK: - Loader Setup
    @Binding var isLoading: Bool
    public var loaderTintColor: Color
    
    // MARK: - Disabled Color Setup
    var disabledBackgroundColor: Color = Color(uiColor: UIColor.systemGray3)
    var disabledBorderColor: Color = Color(uiColor: UIColor.systemGray3)
    var disabledTintColor: Color?
    
    
    public init(isFullWidth: Bool = true,
                backgroundColor: Color = .blue,
                borderColor: Color = .blue,
                lineWidth: CGFloat = 1.0,
                padding: RUIPadding = RUIPadding(vertical: 12, horizontal: 16),
                cornerRadius: CGFloat = 4,
                isLoading: Binding<Bool> = .constant(false),
                loaderTintColor: Color = .white,
                disabledBackgroundColor: Color = Color(uiColor: UIColor.systemGray3),
                disabledBorderColor: Color = Color(uiColor: UIColor.systemGray3),
                disabledTintColor: Color? = nil
    ) {
        self.isFullWidth = isFullWidth
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.lineWidth = lineWidth
        self.leadingPadding = padding.leading
        self.topPadding = padding.top
        self.trailingPadding = padding.trailing
        self.bottomPadding = padding.bottom
        self.cornerRadius = cornerRadius
        
        self._isLoading = isLoading
        self.loaderTintColor = loaderTintColor
        
        self.disabledBackgroundColor = disabledBorderColor
        self.disabledBorderColor = disabledBorderColor
        self.disabledTintColor = disabledTintColor
    }
    
    
    
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            
            // MARK: - Spacer
            if isFullWidth {
                Spacer()
            }
            
            // MARK: - Content
            if isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .tint(isEnabled ? loaderTintColor : (disabledTintColor != nil ? disabledTintColor : loaderTintColor))
            } else {
                configuration
                    .label
            }
            
            // MARK: - Spacer
            if isFullWidth {
                Spacer()
            }
        }
        .padding(.leading, leadingPadding)
        .padding(.top, topPadding)
        .padding(.trailing, trailingPadding)
        .padding(.bottom, bottomPadding)
        .background(isEnabled ? backgroundColor : disabledBackgroundColor)
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(isEnabled ? borderColor : disabledBorderColor, lineWidth: lineWidth)
        )
        .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
