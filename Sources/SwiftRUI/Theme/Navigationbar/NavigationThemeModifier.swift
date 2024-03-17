//
//  File.swift
//  
//
//  Created by Swee Kwang Chua on 18/1/24.
//

import SwiftUI

struct NavigationThemeModifier: ViewModifier {
    @Environment(\.theme) var theme: Theme
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                UINavigationBar.appearance().titleTextAttributes = [
                    .foregroundColor: theme.colors.onBackground
                ]
                
                UINavigationBar.appearance().largeTitleTextAttributes = [
                    .foregroundColor: theme.colors.onBackground
                ]
            }
    }
}
