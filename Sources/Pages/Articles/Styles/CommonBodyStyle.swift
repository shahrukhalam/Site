//
//  DarkIndexBodyStyle.swift
//  
//
//  Created by Shahrukh Alam on 08/08/22.
//

import HTMLDSL

public struct CommonBodyStyle: CSSStyle {
    public let key: CustomStringConvertible = Tag.empty.description
    public let styles = [Style]()

    public var element: String

    public init() {
        let bodyStyle = TagStyle(for: .enclosing(.body))
            .padding(top: .pixel(57))
            .backgroundColor(isDarkMode ? Color.Dark.IndexBackground : Color.Light.IndexBackground)
            .foregroundColor(isDarkMode ? Color.Dark.IndexForeground : Color.Light.IndexForeground)
            .font(family: .sansSerif([.SFProDisplay, .SFProIcons, .HelveticaNeue]))
//            .lineHeight(.number(Typography.Global.lineHeight))

        self.element = bodyStyle.element
    }
}
