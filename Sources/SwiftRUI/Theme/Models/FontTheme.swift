//
//  File.swift
//  
//
//  Created by Swee Kwang Chua on 14/3/24.
//

import SwiftUI

public struct FontTheme {
    public var title1: Font
    public var title2: Font
    public var title3: Font
    public var heading1: Font
    public var heading2: Font
    public var heading3: Font
    public var subheading1: Font
    public var subheading2: Font
    public var subheading3: Font
    public var body: Font
    public var label: Font
    public var callout: Font
    
    /// Initializes a new theme with specified font styles.
    ///
    /// - Parameters:
    ///   - title1: The default font for title1. Default is .largeTitle.
    ///   - title2: The default font for title2. Default is .title.
    ///   - title3: The default font for title3. Default is .headline.
    ///   - heading1: The default font for heading1. Default is .title.
    ///   - heading2: The default font for heading2. Default is .title.
    ///   - heading3: The default font for heading3. Default is .title.
    ///   - subheading1: The default font for subheading1. Default is .subheadline.
    ///   - subheading2: The default font for subheading2. Default is .subheadline.
    ///   - subheading3: The default font for subheading3. Default is .subheadline.
    ///   - title: The default font for titles. Default is .title.
    ///   - headline: The default font for headlines. Default is .headline.
    ///   - subhead: The default font for subheadings. Default is .subheadline.
    ///   - body: The default font for body text. Default is .body.
    ///   - label: The default font for labels. Default is .footnote.
    ///   - callout: The default font for callouts. Default is .callout.
    public init(
        title1: Font = .title,
        title2: Font = .title2,
        title3: Font = .title3,
        heading1: Font = .system(size: 20),
        heading2: Font = .system(size: 18),
        heading3: Font = .system(size: 16),
        subheading1: Font = .system(size: 18),
        subheading2: Font = .system(size: 16),
        subheading3: Font = .system(size: 12),
        body: Font = .body,
        label: Font = .footnote,
        callout: Font = .callout
    ) {
        self.title1 = title1
        self.title2 = title2
        self.title3 = title3
        self.heading1 = heading1
        self.heading2 = heading2
        self.heading3 = heading3
        self.subheading1 = subheading1
        self.subheading2 = subheading2
        self.subheading3 = subheading3
        self.body = body
        self.label = label
        self.callout = callout
    }
}

