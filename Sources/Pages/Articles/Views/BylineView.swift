import Foundation
import HTMLDSL
import Modeling

struct BylineView: HTMLBodyContentView {
    var tag: Tag = .empty
    var attributes = [Attribute]()
    
    let bylines: [Article.Detail.Byline]
    init(bylines: [Article.Detail.Byline]) {
        self.bylines = bylines
    }
    
    var body: some View {
        let bylineViews = bylines.map { byline in
            Div {
                switch byline {
                case .published(let date):
                    Paragraphs("Published on: \(date.bylineFormatted)")
                        .foregroundColor(Color.Dark.ActiveNavBarItem)
                        .font(size: .relativeToRootFontSize(Typography.Font.Size.byline))
                        .font(weight: .number(Typography.Font.Weight.byline))
                        .margin()
                case .updated(let date):
                    Paragraphs("Updated on: \(date.bylineFormatted)")
                        .foregroundColor(Color.Dark.ActiveNavBarItem)
                        .font(size: .relativeToRootFontSize(Typography.Font.Size.byline))
                        .font(weight: .number(Typography.Font.Weight.byline))
                        .margin()
                case let .author(name, url):
                    ParagraphsLink("Author: ", linkText: name, url: url)
                        .foregroundColor(Color.Dark.ActiveNavBarItem)
                        .font(size: .relativeToRootFontSize(Typography.Font.Size.byline))
                        .font(weight: .number(Typography.Font.Weight.byline))
                        .margin()
                }
            }
            .identifyBy(cssClass: .bylineItem)
            .margin()
        }
        
        return Div(AnyView(bylineViews))
            .identifyBy(cssClass: .bylineContainer)
            .margin(
                top: .length(.relativeToRoot(Typography.Margin.byline)),
                bottom: .length(.relativeToRoot(Typography.Margin.byline))
            )
    }
}
