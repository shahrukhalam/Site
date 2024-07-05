//
//  MediaStyle.swift
//  
//
//  Created by Shahrukh Alam on 25/09/2022.
//

import HTMLDSL

public struct MediaStyle: CSSStyle {
    public enum DeviceType: String {
        case small = "@media screen and (max-width: 900px)"
        case wide = "@media screen and (min-width: 900px)"
    }
    
    enum ColorScheme: String {
        case light = "@media (prefers-color-scheme: light)"
        case dark = "@media (prefers-color-scheme: dark)"
    }

    public let key: CustomStringConvertible
    public let styles: [Style] = []
    public let element: String

    public init(for type: DeviceType, with style: CSSStyle) {
        self.key = type.rawValue
        self.element = "\(key) {\n\(style.element)\n}"
    }
    
    init(for scheme: ColorScheme, with style: CSSStyle) {
        self.key = scheme.rawValue
        self.element = "\(key) {\n\(style.element)\n}"
    }
}
