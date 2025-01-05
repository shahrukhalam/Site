import HTMLDSL
import NotionParsing

public struct Sponsor: HTMLBodyContentView {
    public var tag: Tag = .empty
    public var attributes = [Attribute]()

    private let sponsor: SponsorPage

    public init(_ sponsor: SponsorPage) {
        self.sponsor = sponsor
    }

    public var body: some View {
        Div {
            Div {
                Paragraphs("SPONSOR")
                    .identifyBy(cssClasses: [.notion(.toggle_important)])

                Div {
                    Image(
                        sponsor.properties.logo.url.absoluteString,
                        alternateText: sponsor.properties.logoAlternateText.richTexts.plainTexts
                    )
                    .identifyBy(cssClass: .sponsorImage)

                    Div {
                        Paragraphs(sponsor.properties.title.richTexts.plainTexts)
                            .identifyBy(cssClass: .sponsorTitle)

                        Paragraphs(sponsor.properties.description.richTexts.plainTexts)

                        Link(
                            text: sponsor.properties.cta.richTexts.plainTexts,
                            url: sponsor.properties.website.url.absoluteString
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
