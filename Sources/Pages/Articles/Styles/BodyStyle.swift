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
        self.element = bodyStyle.element
    }
}
