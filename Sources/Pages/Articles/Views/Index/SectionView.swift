import Modeling
import HTMLDSL

struct SectionView: HTMLBodyContentView {
    var tag: Tag = .empty
    var attributes: [Attribute] = []
    
    private let section: Section
    
    init(section: Section) {
        self.section = section
    }
    
    var body: some HTMLBodyContentView {
        let tagViews = section.subsections.map { subsection in
            PillButton(text: subsection.detail.description.title, url: subsection.detail.link.url)
                .identifyBy(cssClass: .flexItem)
        }
        
        return Div {
            Headings(section.description.title, type: .h1)
                .font(size: .relativeToRootFontSize(Typography.Font.Size.heading2))
                .margin(
                    top: .length(.relativeToRoot(Typography.Margin.title)),
                    bottom: .length(.relativeToRoot(Typography.Margin.heading3))
                )
            Div(AnyView(tagViews))
                .identifyBy(cssClass: .flexContainer)
        }
        .identifyBy(cssClass: .section)
    }
}
