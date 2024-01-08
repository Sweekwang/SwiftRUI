//
//  File.swift
//  
//
//  Created by Swee Kwang Chua on 11/2/23.
//

import SwiftUI

extension View {
    func padding(_ padding: RUIPadding) -> some View {
        return self
            .padding(.top, padding.top)
            .padding(.trailing, padding.trailing)
            .padding(.bottom, padding.bottom)
            .padding(.leading, padding.leading)
    }
}
