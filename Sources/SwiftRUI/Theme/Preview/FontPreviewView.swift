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
            ScrollView {
                VStack {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Title One: The Quick Brown Fox Jumps Over the Lazy Dog")
                            .font(fontTheme.title1)
                        
                        Text("Heading One: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eu.")
                            .font(fontTheme.heading1)
                        
                        Text("Subheading One: Integer posuere erat a ante venenatis dapibus posuere velit aliquet.")
                            .font(fontTheme.subheading1)
                        
                        Text("Body: Donec ullamcorper nulla non metus auctor fringilla. Duis mollis, est non commodo luctus, nisi erat porttitor ligula.")
                            .font(fontTheme.body)
                        
                        Text("label: Donec ullamcorper nulla non metus auctor fringilla. Duis mollis, est non commodo luctus, nisi erat porttitor ligula.")
                            .font(fontTheme.label)
                        
                        Text("label: Donec ullamcorper nulla non metus auctor fringilla. Duis mollis, est non commodo luctus, nisi erat porttitor ligula.")
                            .font(fontTheme.callout)
                    }
                    .padding(.bottom, 24)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Title Two: Etiam porta sem malesuada magna mollis euismod.")
                            .font(fontTheme.title2)
                        
                        Text("Heading Two: Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.")
                            .font(fontTheme.heading2)
                        
                        Text("Subheading One: Integer posuere erat a ante venenatis dapibus posuere velit aliquet.")
                            .font(fontTheme.subheading2)
                    }
                    .padding(.bottom, 24)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Title Three: Curabitur blandit tempus porttitor.")
                            .font(fontTheme.title3)
                        
                        Text("Heading Three: Nullam quis risus eget urna mollis ornare vel eu leo.")
                            .font(fontTheme.heading3)
                        
                        Text("Subheading One: Integer posuere erat a ante venenatis dapibus posuere velit aliquet.")
                            .font(fontTheme.subheading3)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    FontPreviewView()
}
