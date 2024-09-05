public struct NavStyle: CSSStyle {
    public static let height: Float = 49.5

    public let key: CustomStringConvertible = Tag.empty.description
    public let styles = [Style]()
    
    public var element: String
    
    public init() {
        let navStyle = ClassStyle(forClass: .indexNav)
            .position(.fixed)
            .constraint(left: .pixel(0), top: .pixel(0), right: .pixel(0))
            .backgroundVariable(.nav_bar_background)
            .align(.center)
            .filter(saturationInPercentage: 180, blurInPixel: 20)
            .zIndex(1)
        
        let linkStyle = ClassStyle(forClass: .indexNav, withTag: .enclosing(.link))
            .padding(uniform: .pixel(16))
            .display(.inlineBlock)
            .textDecoration(.none)
            .font(size: .relativeToRootFontSize(Typography.Font.Size.byline))
        
        let activeLinkStyle = ClassStyle(forClass: .activeLink)
            .foregroundVariable(.nav_bar_active_item)
            .pointer(.none)
        
        let inactiveLinkStyle = ClassStyle(forClass: .inactiveLink)
            .foregroundVariable(.nav_bar_inactive_item)

        let hoverLinkStyle = TagStyle(for: .enclosing(.link), with: .hover)
            .foregroundVariable(.nav_bar_hover_item)
        
        let dividerStyle = ClassStyle(forClass: .dividerNav)
            .backgroundVariable(.nav_bar_divider)
            .size(height: .pixel(1))
            .border(width: .pixel(0))

        let classStyles = [navStyle, linkStyle, activeLinkStyle, inactiveLinkStyle, dividerStyle]
            .map { $0.element }
        let tagStyles = [hoverLinkStyle].map { $0.element }
        let allStyles = classStyles + tagStyles
        self.element = allStyles
            .joined(separator: "\n")
    }
}
