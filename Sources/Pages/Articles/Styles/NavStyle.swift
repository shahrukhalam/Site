//
//  NavStyle.swift
//  
//
//  Created by Shahrukh Alam on 08/08/22.
//

import HTMLDSL

public struct NavStyle: CSSStyle {
    public let key: CustomStringConvertible = Tag.empty.description
    public let styles = [Style]()
    
    public var element: String
    
    public init() {
        let navStyle = ClassStyle(forClass: .indexNav)
            .position(.fixed)
            .constraint(left: .pixel(0), top: .pixel(0), right: .pixel(0))
            .backgroundColor(isDarkMode ? Color.Dark.NavBarColor : Color.Light.NavBarColor)
            .align(.center)
            .filter(saturationInPercentage: 180, blurInPixel: 20)
            .zIndex(1)
        
        let linkStyle = ClassStyle(forClass: .indexNav, withTag: .enclosing(.link))
            .padding(uniform: .pixel(16))
            .display(.inlineBlock)
            .textDecoration(.none)
            .font(size: .percentage(125))
        
        let activeLinkStyle = ClassStyle(forClass: .activeLink)
            .foregroundColor(isDarkMode ? Color.Dark.ActiveNavBarItem : Color.Light.ActiveNavBarItem)
            .pointer(.none)
        
        let inactiveLinkStyle = ClassStyle(forClass: .inactiveLink)
            .foregroundColor(isDarkMode ? Color.Dark.InactiveNavBarItem : Color.Light.InactiveNavBarItem)
        
        let hoverLinkStyle = TagStyle(for: .enclosing(.link), with: .hover)
            .foregroundColor(isDarkMode ? Color.Dark.HoverNavBarItem : Color.Light.HoverNavBarItem)
        
        let classStyles = [navStyle, linkStyle, activeLinkStyle, inactiveLinkStyle]
            .map { $0.element }
        let tagStyles = [hoverLinkStyle].map { $0.element }
        let allStyles = classStyles + tagStyles
        self.element = allStyles
            .joined(separator: "\n")
    }
}
