public var shareStyle: some CSSStyle {
    let pStyle = ClassStyle(forClass: .share, withTag: .enclosing(.paragraph))
        .font(size: .relativeToRootFontSize(Typography.Font.Size.body))
        .lineHeight(.number(Typography.LineHeight.body))
        .foregroundVariable(.index_foreground)

    let linkStyle = ClassStyle(forClass: .share, withTag: .enclosing(.link))
        .display(.inlineFlex)
        .flexDistribute(.center)
        .foregroundVariable(.link_foreground)
        .textDecoration(.none)
    let linkHoverStyle = ClassStyle(.share, tag: .enclosing(.link), cssTag: .hover)
        .foregroundVariable(.link_foreground)
        .textDecoration(.underline)
    let pLinkStyle = ClassStyle(parent1: .share, parent12: .enclosing(.link), child: .enclosing(.paragraph))
        .foregroundVariable(.link_foreground)
    return [pStyle, linkStyle, linkHoverStyle, pLinkStyle]
}
