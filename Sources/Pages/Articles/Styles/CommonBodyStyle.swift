//
//  DarkIndexBodyStyle.swift
//  
//
//  Created by Shahrukh Alam on 08/08/22.
//

import HTMLDSL

struct CommonBodyStyle: CSSStyle {
    let key: CustomStringConvertible = Tag.empty.description
    let styles = [Style]()

    var element: String

    init(_ mediaType: MediaStyle.DeviceType) {
        let htmlStyle = TagStyle(for: .enclosing(.html))
            .backgroundColor(isDarkMode ? Color.Dark.IndexBackground : Color.Light.IndexBackground)
            .foregroundColor(isDarkMode ? Color.Dark.IndexForeground : Color.Light.IndexForeground)
            .font(family: .apple([.notion]))
            .font(size: mediaType == .wide ? .pixel(16) : .pixel(14))

        let bodyStyle = TagStyle(for: .enclosing(.body))
            .padding(top: .pixel(57))

        let styles = [htmlStyle, bodyStyle]
        self.element = styles.map { $0.element }.joined(separator: "\n")
    }
}
