//
//  SwiftUIView.swift
//  
//
//  Created by Swee Kwang Chua on 28/5/23.
//

import SwiftUI

public enum ShimmerDirection {
    case leadingToTrailing
    case leadingTopToTrailingBottom
    
    var getDegrees: Angle {
        switch self {
        case .leadingToTrailing:
            return .degrees(0)
        case .leadingTopToTrailingBottom:
            return .degrees(20)
        }
    }
}

/// ShimmerView create a loading effect than can move from leading to right or top, leading
/// to bottom trailling.
/// ShimmerEffectBox()
///    .frame(width: 150, height: 150)
///    .cornerRadius(150)
public struct ShimmerView: View {
    let backgroundColor: Color
    let lineColor: Color
    let direction: ShimmerDirection
    
    // Properties determine whether it should start animatio or not.
    @State private var animateGradient = true
    
    // This color doesn't affect how it look
    private var gradientColors:[Color] = [.clear, .red, .clear]
    
    public init(
        backgroundColor: Color = Color(uiColor: UIColor.systemGray5),
         lineColor: Color = Color(uiColor: UIColor.systemGray6),
         direction: ShimmerDirection = .leadingTopToTrailingBottom
    ) {
        self.backgroundColor = backgroundColor
        self.lineColor = lineColor
        self.direction = direction
    }
    
    
    // MARK: - Body
    public var body: some View {
        GeometryReader { (geometry) in
            backgroundColor
            
            lineColor
                .mask(
                    LinearGradient(
                        colors: gradientColors,
                        startPoint: .leading,
                        endPoint: .trailing)
                    .scaleEffect(2)
                    .rotationEffect(direction.getDegrees)
                    .offset(x: self.animateGradient ? -(geometry.size.width * 2): (geometry.size.width*2))
                    
                )
        }
        .onAppear {
            /// start the animation when the view already appear
            withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: false)) {
                animateGradient.toggle()
            }
        }
    }
}

struct ShimmerView_Previews: PreviewProvider {
    static var previews: some View {
        ShimmerView()
            .frame(width: 150, height: 150)
            .cornerRadius(150)
    }
}
