public struct BodyStyle: CSSStyle {
    public let key: CustomStringConvertible = Tag.empty.description
    public let styles = [Style]()

    public var element: String
    
    public init(isApp: Bool, isFooterEnabled: Bool) {
        var bodyStyle: CSSStyle

        bodyStyle = TagStyle(for: .enclosing(.body))
            .backgroundVariable(.index_background)
            .foregroundVariable(.index_foreground)
            .font(family: .apple([.notion]))

        if isFooterEnabled {
            /// To make footer stay at the bottom
            /// https://philipwalton.github.io/solved-by-flexbox/demos/sticky-footer/
            bodyStyle = bodyStyle
                .display(.flex)
                .flexDirection(.vertical)
                .size(minHeight: .fullViewPortHeight)
        } else {
            bodyStyle = bodyStyle
                .padding(top: isApp ? .pixel(0) : .pixel(NavStyle.height))
        }

        self.element = bodyStyle.element
    }
}
