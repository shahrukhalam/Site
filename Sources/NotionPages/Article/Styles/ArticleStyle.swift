public struct ArticleStyle: CSSStyle {
    public let key: CustomStringConvertible = Tag.empty.description
    public let styles = [Style]()
    
    public var element: String
    
    public init() {
        let articleStyle = ClassStyle(forClass: .article)
            .margin(
                top: .length(.relativeToRoot(Typography.Margin.title)),
                bottom: .length(.relativeToRoot(Typography.Margin.title))
            )
            .padding(
                bottom: .length(.relativeToRoot(Typography.Margin.heading1))
            )
            /// To make footer stay at the bottom
            /// https://philipwalton.github.io/solved-by-flexbox/demos/sticky-footer/
            .flex(value: 1)
        self.element = articleStyle.element
    }
}
