private let linkStyle = ClassStyle(forClass: .link)
    .foregroundVariable(.link_foreground)
    .font(size: .percentage(100))
    .textDecoration(.none)

private let linkHoverStyle = ClassStyle(forClass: .link, withCSSTag: .hover)
    .foregroundVariable(.link_foreground)
    .textDecoration(.underline)

func commonStyles() -> some CSSStyle {
    [linkStyle, linkHoverStyle]
}
