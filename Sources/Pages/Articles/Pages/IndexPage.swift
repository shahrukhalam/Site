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
                    
                    Headings("Collections", type: .h1)
                        .font(size: .relativeToRootFontSize(Typography.Font.Size.heading2))
                        .margin(
                            top: .length(.relativeToRoot(Typography.Margin.title)),
                            bottom: .length(.relativeToRoot(Typography.Margin.heading3))
                        )
                    Grid(model: sections.first!.subsections)
                }
                .size(width: .percentage(50))
                .margin(
                    left: .auto,
                    top: .length(.relativeToRoot(Typography.Margin.heading3)),
                    right: .auto,
                    bottom: .length(.relativeToRoot(Typography.Margin.heading3))
                )
            }
        }
    }
}
