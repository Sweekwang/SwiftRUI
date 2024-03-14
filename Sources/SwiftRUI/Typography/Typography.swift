//
//  SwiftUIView.swift
//  
//
//  Created by Swee Kwang Chua on 14/3/24.
//

import SwiftUI

struct Typography: View {
    var text: String
    var style: TextStyle
    
    var body: some View {
        Text(text)
            .font(style.font)
            .foregroundColor(style.color)
            .multilineTextAlignment(style.textAlignment)
    }
}

#Preview {
    Typography()
}
