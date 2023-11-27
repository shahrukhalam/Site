import HTMLDSL

struct BodyStyle: CSSStyle {
    let key: CustomStringConvertible = Tag.empty.description
    let styles = [Style]()
    
    var element: String
    
    init(isApp: Bool) {
        let bodyStyle = TagStyle(for: .enclosing(.body))
            .backgroundVariable(.index_background)
            .foregroundVariable(.index_foreground)
            .padding(top: isApp ? .pixel(0) : .pixel(57))
            .font(family: .apple([.notion]))
        /// To make footer stay at the bottom
        /// https://philipwalton.github.io/solved-by-flexbox/demos/sticky-footer/
//            .display(.flex)
//            .flexDirection(.vertical)
//            .size(minHeight: .fullViewPortHeight)
        self.element = bodyStyle.element
    }
}
