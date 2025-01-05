import FoundationPages
import HTMLDSL
import NotionParsing

struct ArticleView: HTMLBodyContentView {
    var tag: Tag = .empty
    var attributes = [Attribute]()

    private let page: NotionParsing.Page
    private let fillers: [Filler]
    private let meta: MetaDetail
    private let bylines: [Article.Detail.Byline]
    private let htmlConfig: NotionHTML.Config

    init(
        _ page: NotionParsing.Page,
        fillers: [Filler],
        meta: MetaDetail,
        bylines: [Article.Detail.Byline],
        htmlConfig: NotionHTML.Config
    ) {
        self.page = page
        self.fillers = fillers
        self.meta = meta
        self.bylines = bylines
        self.htmlConfig = htmlConfig
    }

    var body: some View {
        Div {
            Div {
                Div {
                    Headings(
                        richTexts: (page.properties.articleTitle?.richTexts.isEmpty != true) ? page.properties.articleTitle!.richTexts : page.properties.title.richTexts
                        ,
                        type: .h1
                    )
                    .identifyBy(cssClass: .notion(.title))

                    BylineView(bylines: bylines)
                }
                .identifyBy(cssClass: .notion(.page))

                Div {
                    for (index, block) in (page.content?.blocks ?? []).enumerated() {
                        for filler in fillers.filter { $0.index == index } {
                            filler.content
                        }

                        htmlBlock(for: block, with: htmlConfig)
                    }
                }
                .identifyBy(cssClass: .notion(.page))

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
