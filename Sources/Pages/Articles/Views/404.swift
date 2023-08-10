import Modeling
import HTMLDSL

private var view404CSS: some HTMLHeadContentView {
    HeadStyle {
        KickOffStyle()
        NavStyle()
        
        MediaStyle(for: .wide, with: RootStyle(.wide))
        MediaStyle(for: .small, with: RootStyle(.small))
        
        commonStyles
        
        MediaStyle(for: .wide, with: fontStyles)
        MediaStyle(for: .small, with: fontStylesSmall)
    }
}

public func view404(tabs: [LinkDescription], selectedIndex: Int, description: Description) -> some View {
    Document {
        HTML {
            Head {
                view404CSS
            }
            
            Body {
                NavView(tabs: tabs, selectedIndex: selectedIndex)
                
                Div {
                    Div {
                        Headings(description.title, type: .h2)
                            .identifyBy(cssClasses: [.title2, .centerText])
                            .foregroundColor(Color.Dark.Title404)
                        Headings(description.subtitle, type: .h4)
                            .identifyBy(cssClasses: [.subheadline, .centerText])
                            .foregroundColor(Color.Dark.Subtitle404)
                            .margin(top: .pixel(16))
                    }
                    .margin(uniform: .pixel(20))
                }
                // `top`: Nav Bar (57) + normal space (20)
                .position(.fixed, left: .pixel(20), top: .pixel(77), right: .pixel(20), bottom: .pixel(20))
                .identifyBy(cssClass: .centerDivContainer)
                .backgroundColor(Color.Dark.ArticleBackground)
            }
        }
    }
}
