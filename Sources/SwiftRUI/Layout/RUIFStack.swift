//
//  SwiftUIView.swift
//  
//
//  Created by Swee Kwang Chua on 19/3/23.
//

import SwiftUI

/// A view that arranges its subviews that take up the whole parent view. You can state how do you want to arrange in the vertical and horizontal line.
///
/// RUIFStack aka FullStack uses `HStack` and `VStack`to renders the views all at once, regardless of whether they are on- or offscreen. Use a RUIFStack when you want to create a view to take up the whole space instead of just using HStack and VStack.
///
/// The following example shows a Text view places at the top leading corner with a black background at the back the cover the whole parent view:
/// ```
/// RUIFStack(verticalAlignment: .top,
///           horizontalAlignment: .leading) {
///     Text("Hello  World!")
///         .padding(24)
///         .background(.white)
///         .cornerRadius(18)
///         .padding(12)
/// }
/// .background(
///     .black
///     .opacity(0.4)
/// )
/// ```
public struct RUIFStack<Content: View>: View {
    @Environment(\.theme) var theme: Theme
    
    @ViewBuilder var content: () -> Content
    public var verticalAlignment: VerticalAlignment
    public var horizontalAlignment: HorizontalAlignment
    
    public init(verticalAlignment: VerticalAlignment = .center,
         horizontalAlignment: HorizontalAlignment = .center,
        @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.verticalAlignment = verticalAlignment
        self.horizontalAlignment = horizontalAlignment
    }
    
    public var body: some View {
        HStack(alignment: verticalAlignment) {
            if horizontalAlignment == .center || horizontalAlignment == .trailing {
                Spacer(minLength: 0)
            }
            
            VStack(alignment: horizontalAlignment) {
                if verticalAlignment == .center || verticalAlignment == .bottom {
                    Spacer(minLength: 0)
                }
                
                VStack(alignment: horizontalAlignment) {
                    content()
                }
                
                if verticalAlignment == .center || verticalAlignment == .top {
                    Spacer(minLength: 0)
                }
            }
            
            if horizontalAlignment == .center || horizontalAlignment == .leading{
                Spacer(minLength: 0)
            }
        }
        .background(
            theme.background
        )
        
    }
}

struct FullView_Previews: PreviewProvider {
    static var previews: some View {
        RUIFStack(verticalAlignment: .top, horizontalAlignment: .leading) {
            Text("Hello  World!")
                .padding(24)
                .background(.white)
                .cornerRadius(18)
                .padding(12)
        }
        .background(
            .black
                .opacity(0.4)
        )
    }
}
