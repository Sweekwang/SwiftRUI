//
//  File.swift
//  
//
//  Created by Swee Kwang Chua on 15/11/23.
//

import SwiftUI

public struct ThemeKey: EnvironmentKey {
    public static let defaultValue: Theme = .default
}

extension EnvironmentValues {
    public var theme: Theme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}
