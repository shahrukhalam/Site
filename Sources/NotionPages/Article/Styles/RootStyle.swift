struct RootStyle: CSSStyle {
    let key: CustomStringConvertible = Tag.empty.description
    let styles = [Style]()

    var element: String

    init(page: NotionPage, colorScheme: MediaStyle.ColorScheme, isApp: Bool) {
        let htmlColorScheme: HTMLDSL.ColorScheme = colorScheme == .light ? .light : .dark

        let htmlTagStyle = TagStyle(for: .enclosing(.html))
        var htmlStyle: CSSStyle

        switch page {
        case .article:
            switch isApp {
            case false:
                htmlStyle = htmlTagStyle
                    .article(colorScheme: htmlColorScheme)
            case true:
                htmlStyle = htmlTagStyle
                    .articleLite(colorScheme: htmlColorScheme)
            }


        case ._404:
            htmlStyle = htmlTagStyle
                ._404(colorScheme: htmlColorScheme)
        }

        switch htmlColorScheme {
        case .light:
            htmlStyle = MediaStyle(for: colorScheme, with: htmlStyle)
        case .dark:
            break
        }

        self.element = htmlStyle.element
    }
}
