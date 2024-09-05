public func commonCSS(page: Page, isApp: Bool) -> some HTMLHeadContentView {
    HeadStyle {
        KickOffStyle()

        RootStyle(page: page, colorScheme: .dark, isApp: isApp)
        RootStyle(page: page, colorScheme: .light, isApp: isApp)

        switch page {
        case .home, .about, .author, ._404:
            BodyStyle(isApp: isApp, isFooterEnabled: true)
        case .articleList, .article:
            BodyStyle(isApp: isApp, isFooterEnabled: false)
        }

        commonStyles(page: page)
        
        switch page {
        case .home, .articleList, ._404:
            NavStyle()
        case .article, .about, .author:
            switch isApp {
            case false:
                NavStyle()
            case true:
                EmptyStyle()
            }
        }
        
        footerStyle
    }
}
