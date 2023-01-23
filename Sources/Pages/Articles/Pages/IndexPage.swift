import Modeling
import HTMLDSL

public func indexPage(tabs: [LinkDescription], selectedIndex: Int, header: SectionHeader, meta: MetaDetail) -> some View {
    Document {
        HTML {
            Head {
                commonMeta(meta)
                commonCSSLinks
                commonCSS
                indexPageCSS
            }
            
            Body {
                NavView(tabs: tabs, selectedIndex: selectedIndex)
                sectionHeader(with: header)
            }
        }
    }
}
