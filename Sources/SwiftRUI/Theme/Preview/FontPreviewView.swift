//
//  SwiftUIView.swift
//  
//
//  Created by Swee Kwang Chua on 14/3/24.
//

import SwiftUI

struct FontPreviewView: View {
    let fontTheme = FontTheme()
    
    var body: some View {
        RUIFStack(verticalAlignment: .top, horizontalAlignment: .leading) {
            Text("Title")
                .font(fontTheme.title1)
            Text("Heading")
                .font(fontTheme.heading1)
            
            Text("Title")
                .font(fontTheme.title2)
            
            Text("Title")
                .font(fontTheme.title3)
            
        }
    }
}

#Preview {
    FontPreviewView()
}
