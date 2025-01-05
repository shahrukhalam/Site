import HTMLDSL
import NotionParsing

public struct Sponsor: HTMLBodyContentView {
    public var tag: Tag = .empty
    public var attributes = [Attribute]()

    private let sponsor: SponsorPage.Properties

    public init(_ sponsor: SponsorPage.Properties) {
        self.sponsor = sponsor
    }

    public var body: some View {
        Div {
            Div {
                Paragraphs("SPONSOR")
                    .identifyBy(cssClasses: [.notion(.toggle_important)])

                Div {
                    Image(
                        sponsor.image.url.absoluteString,
                        alternateText: sponsor.imageAlternateText.richTexts.plainTexts
                    )
                    .identifyBy(cssClass: .sponsorImage)

                    Div {
                        Paragraphs(sponsor.title.richTexts.plainTexts)
                            .identifyBy(cssClass: .sponsorTitle)

                        Paragraphs(sponsor.description.richTexts.plainTexts)

                        Link(
                            text: sponsor.cta.richTexts.plainTexts,
                            url: sponsor.website.url.absoluteString
                        )
                        .identifyBy(cssClass: .borderedProminentLink)
                    }
                    .identifyBy(cssClass: .sponsorDetail)
                }
                .identifyBy(cssClass: .sponsorContainer)
            }
            .identifyBy(cssClasses: [.notion(.toggle_container), .notion(.toggle_important_container)])
        }
        .identifyBy(cssClass: .notion(.page))
    }
}
