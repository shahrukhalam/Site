func commonCSS(isApp: Bool) -> some HTMLHeadContentView {
    HeadStyle {
        KickOffStyle()

        RootStyle(colorScheme: .dark, isApp: isApp)
        RootStyle(colorScheme: .light, isApp: isApp)

        BodyStyle(isApp: isApp, isFooterEnabled: false)

        commonStyles()


        switch isApp {
        case false:
            NavStyle()
        case true:
            EmptyStyle()
        }

        footerStyle
    }
}
