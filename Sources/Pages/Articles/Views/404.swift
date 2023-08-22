import Modeling
import HTMLDSL

private var view404CSS: some HTMLHeadContentView {
    HeadStyle {
        ClassStyle(forClass: .container404)
            .backgroundVariable(.background_404)
        ClassStyle(forClass: .title404)
            .foregroundVariable(.title_404)
        ClassStyle(forClass: .subtitle404)
            .foregroundVariable(.subtitle_404)
    }
}

public func view404(tabs: [LinkDescription], selectedIndex: Int, description: Description, isApp: Bool) -> some View {
    Document {
        HTML {
            Head {
                commonCSS(isApp: isApp)
                view404CSS
            }
            
            Body {
                NavView(tabs: tabs, selectedIndex: selectedIndex)
                
                Div {
                    Div {
                        Headings(description.title, type: .h2)
                            .identifyBy(cssClasses: [.title2, .centerText, .title404])
                        Headings(description.subtitle, type: .h4)
                            .identifyBy(cssClasses: [.subheadline, .centerText, .subtitle404])
                            .margin(top: .pixel(16))
                    }
                    .margin(uniform: .pixel(20))
                }
                // `top`: Nav Bar (57) + normal space (20)
                .position(.fixed, left: .pixel(20), top: .pixel(77), right: .pixel(20), bottom: .pixel(20))
                .identifyBy(cssClasses: [.centerDivContainer, .container404])
            }
        }
    }
}
