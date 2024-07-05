import HTMLDSL
import Pages

func notionPageCSS() -> some HTMLHeadContentView {
    HeadStyle {
        ArticleStyle()

        /// the order is important
        /// `wide` first, then `small`
        articleContainerStyle(.wide)
        articleContainerStyle(.small)

        /// the order is important
        /// `wide` first, then `small`
        NotionStyle(.wide)
        NotionStyle(.small)

        shareStyle
        commentBoxDisclosureStyle
    }
}
