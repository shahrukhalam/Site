private let linkStyle = ClassStyle(forClass: .link)
    .foregroundVariable(.link_foreground)
    .font(size: .percentage(100))
    .textDecoration(.none)

private let linkHoverStyle = ClassStyle(forClass: .link, withCSSTag: .hover)
    .foregroundVariable(.link_foreground)
    .textDecoration(.underline)

func commonStyles(page: NotionPage) -> some CSSStyle {
    switch page {
    case .article:
        return AnyStyle(contents: [linkStyle, linkHoverStyle])
    case ._404:
        return AnyStyle(contents: [])
    }
}
