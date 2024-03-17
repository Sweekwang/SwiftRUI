//
//  File.swift
//  
//
//  Created by Swee Kwang Chua on 18/1/24.
//

import SwiftUI

extension View {
    func navigationTheme() -> some View {
        self.modifier(NavigationThemeModifier())
    }
}
