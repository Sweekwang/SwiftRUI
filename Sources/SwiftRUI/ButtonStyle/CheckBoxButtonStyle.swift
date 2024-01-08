//
//  File.swift
//  
//
//  Created by Swee Kwang Chua on 5/3/23.
//

import SwiftUI

/// A button style that applies checked or tick checkbox style based on the button's context.
///
/// Create a rounded checkbox by creating a  text-only`button` and apply buttonStyle modifier. A state variable is used to control
/// the state of selection.
/// ```
/// @State var isSelected = false
///
/// var body: some View {
///    Button("level") {
///       isSelected.toggle()
///    }
///    .buttonStyle(RUICheckBoxButtonStyle(isCheck: $isSelected, boxCornerRadius: 50))
/// }
/// ```
///
/// Changing checkbox style can be done at the initializer level.
/// ```
/// RUICheckBoxButtonStyle(isCheck:,
///                        boxBackgroundColor:,
///                        boxSelectedBackgroundColor:,
///                        boxStrokeColor:,
///                        boxSelectedStrokeColor:,
///                        boxTickColor:,
///                        boxWidth:,
///                        boxHeight:,
///                        boxCornerRadius:,
///                        boxLineWidth:,
///                        boxPadding:)
/// ```
public struct RUICheckBoxButtonStyle: PrimitiveButtonStyle {
    @Binding public var isCheck: Bool
    public var boxBackgroundColor: Color
    public var boxSelectedBackgroundColor: Color
    public var boxStrokeColor: Color
    public var boxSelectedStrokeColor: Color
    public var boxTickColor: Color
    public var boxWidth: CGFloat
    public var boxHeight: CGFloat
    public var boxCornerRadius: CGFloat
    public var boxLineWidth: CGFloat
    public var boxPadding: RUIPadding
    public var isWholeButtonSelectable: Bool
    
    public init(isCheck: Binding<Bool> = .constant(false),
                boxBackgroundColor: Color = .clear,
                boxSelectedBackgroundColor: Color = .blue,
                boxStrokeColor: Color = .gray,
                boxSelectedStrokeColor: Color = .blue,
                boxTickColor: Color = .white,
                boxWidth: CGFloat = 24,
                boxHeight: CGFloat = 24,
                boxCornerRadius: CGFloat = 4,
                boxLineWidth: CGFloat = 2,
                boxPadding: RUIPadding = RUIPadding(vertical: 6),
                isWholeButtonSelectable: Bool = true) {
        self._isCheck = isCheck
        self.boxBackgroundColor = boxBackgroundColor
        self.boxSelectedBackgroundColor = boxSelectedBackgroundColor
        self.boxStrokeColor = boxStrokeColor
        self.boxSelectedStrokeColor = boxSelectedStrokeColor
        self.boxTickColor = boxTickColor
        self.boxWidth = boxWidth
        self.boxHeight = boxHeight
        self.boxCornerRadius = boxCornerRadius
        self.boxLineWidth = boxLineWidth
        self.boxPadding = boxPadding
        self.isWholeButtonSelectable = isWholeButtonSelectable
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            ZStack {
                if (isCheck) {
                    Image(systemName: "checkmark")
                        .resizable()
                        .foregroundColor(boxTickColor)
                        .padding(6)
                } else {
                    EmptyView()
                }
            }
            .frame(width: boxWidth, height: boxHeight)
            .background(isCheck ? boxSelectedBackgroundColor : boxBackgroundColor)
            .cornerRadius(boxCornerRadius)
            .overlay {
                RoundedRectangle(cornerRadius: boxCornerRadius)
                    .stroke(isCheck ? boxSelectedStrokeColor : boxStrokeColor, lineWidth: boxLineWidth)
            }
            .onTapGesture {
                configuration.trigger()
                
            }
            
            configuration.label
            
            Spacer()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            if (isWholeButtonSelectable) {
                configuration.trigger()
            }
        }
    }
}
