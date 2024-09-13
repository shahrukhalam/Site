struct ArticleView: HTMLBodyContentView {
    var tag: Tag = .empty
    var attributes = [Attribute]()

    private let page: NotionParsing.Page
    private let meta: MetaDetail
    private let htmlConfig: NotionHTML.Config

    init(_ page: NotionParsing.Page, meta: MetaDetail, htmlConfig: NotionHTML.Config) {
        self.page = page
        self.meta = meta
        self.htmlConfig = htmlConfig
    }

    var body: some View {
        Div {
            Div {
                htmlBody(for: page, with: htmlConfig)

                share(title: meta.title, url: meta.absoluteURL)
                    .margin(top: .length(.relativeToRoot(Typography.Margin.title)))

                Div {
                    Paragraphs("This is a free third party commenting service we are using for you, which needs you to sign in to post a comment, but the good bit is you can stay anonymous while commenting.")
                        .font(size: .relativeToRootFontSize(Typography.Font.Size.byline))
                        .font(weight: .number(Typography.Font.Weight.byline))
                        .margin(bottom: .length(.relativeToRoot(Typography.Margin.byline)))
                        .identifyBy(cssClass: .commentBoxDisclosure)
                    commentBox
                }
                .margin(
                    top: .length(.relativeToRoot(Typography.Margin.title))
                )
            }
            .identifyBy(cssClass: .articleContainer)
        }
        .identifyBy(cssClass: .article)
    }
}
