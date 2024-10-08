func commonCSS(page: NotionPage, isApp: Bool) -> some HTMLHeadContentView {
    HeadStyle {
        KickOffStyle()

        RootStyle(page: page, colorScheme: .dark, isApp: isApp)
        RootStyle(page: page, colorScheme: .light, isApp: isApp)

        switch page {
        case ._404:
            BodyStyle(isApp: isApp, isFooterEnabled: true)
        case .article:
            BodyStyle(isApp: isApp, isFooterEnabled: false)
        }

        commonStyles(page: page)

        switch page {
        case ._404:
            NavStyle()
        case .article:
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
