import Modeling
import HTMLDSL

public func indexPage(tabs: [LinkDescription], selectedIndex: Int, sections: [Section], meta: MetaDetail, analyticsID: String) -> some View {
    Document {
        HTML {
            Head {
                commonMeta(meta)
                commonCSSLinks
                commonCSS
                indexPageCSS

                AnalyticsScript(id: analyticsID)
            }
            
            Body {
                NavView(tabs: tabs, selectedIndex: selectedIndex)
                
                Div {
                    for section in sections {
                        SectionView(section: section)
                    }
                }
                .margin(
                    top: .length(.relativeToRoot(Typography.Margin.heading3)),
                    bottom: .length(.relativeToRoot(Typography.Margin.heading3))
                )
            }
        }
    }
}
