func articlePageCSS() -> some HTMLHeadContentView {
    HeadStyle {
        ArticleStyle()

        /// the order is important
        /// `wide` first, then `small`
        articleContainerStyle(.wide)
        articleContainerStyle(.small)

        bylineStyle

        /// the order is important
        /// `wide` first, then `small`
        ArticleContentStyle(.wide)
        ArticleContentStyle(.small)

        shareStyle
        commentBoxDisclosureStyle
    }
}
