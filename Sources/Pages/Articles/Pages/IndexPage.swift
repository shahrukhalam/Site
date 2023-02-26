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

//                AnalyticsScript(id: analyticsID)
//                Script(url: "https://unpkg.com/vue@3/dist/vue.global.prod.js")
                CSSLink(preloadImage: header.grids.first?.detail.image.url ?? "")
            }
            
            Body {
                NavView(tabs: tabs, selectedIndex: selectedIndex)
                sectionHeader(with: header)
                Div("").identifyBy(id: "app")
                AnalyticsScript(id: analyticsID)
            }
        }
    }
}
