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
                .identifyBy(cssClass: .title1)
                .margin(top: .pixel(32), bottom: .pixel(24))
            Div(AnyView(tagViews))
                .identifyBy(cssClass: .flexContainer)
        }
        .size(width: .percentage(50))
        .centerX()
    }
}
