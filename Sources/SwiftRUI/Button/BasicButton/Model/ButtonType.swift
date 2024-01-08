//
//  File.swift
//  
//
//  Created by Swee Kwang Chua on 30/11/23.
//

import Foundation


/// `ButtonType` defines the appearance of a button, including its colors. These styles can be overridden by setting specific colors when creating a button.
///
/// - plain: A minimalistic button style.
///   - Background color: Transparent.
///   - Outline color: Transparent.
///   - Foreground color: Uses the primary color.
///
/// - filled: A prominent button style that stands out.
///   - Background color: Uses the primary color.
///   - Outline color: Matches the background color.
///   - Foreground color: Uses the onPrimary color for contrast with the background.
///
/// - outlined: A button with a clear boundary.
///   - Background color: Transparent.
///   - Outline color: Uses the primary color.
///   - Foreground color: Matches the outline color.
enum ButtonType {
    case plain
    case filled
    case outlined
}
