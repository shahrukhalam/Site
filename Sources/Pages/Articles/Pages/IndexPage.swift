import Modeling
import HTMLDSL

public func indexPage(tabs: [LinkDescription], selectedIndex: Int, header: SectionHeader, meta: MetaDetail, analyticsID: String) -> some View {
    Document {
        HTML {
            Head {
                commonMeta(meta)
                commonCSSLinks
                commonCSS
                indexPageCSS

                AnalyticsScript(id: analyticsID)
                CSSLink(preloadImage: header.grids.first?.detail.image.url ?? "")
            }
            
            Body {
                NavView(tabs: tabs, selectedIndex: selectedIndex)
                sectionHeader(with: header)
            }
        }
    }
}
