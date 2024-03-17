//
//  SwiftUIView.swift
//  
//
//  Created by Swee Kwang Chua on 14/3/24.
//

import SwiftUI

///  In some situations TextStyle key might not fit your app font type. Hopefully, you might be able to take advantage of the typography keys of the theme.
struct Typography: View {
    var text: String
    var style: TextStyle
    
    var body: some View {
        Text(text)
    }
}

#Preview {
    Typography(text: "Typography", style: .body)
}
