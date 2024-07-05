import HTMLDSL
import Pages

struct NotionStyle: CSSStyle {
    let key: CustomStringConvertible
    let styles = [Style]()
    
    var element: String
    
    init(_ mediaType: MediaStyle.DeviceType) {
        self.key = Tag.empty.description
        
        let styles: [CSSStyle]
        switch mediaType {
        case .wide:
            // MARK: Common

            let commonStyle = ClassStyle(elementsInClass: .notion(.page))
                .lineHeight(.number(Typography.LineHeight.body))
                .foregroundVariable(.index_foreground)
                .margin(top: .length(.relativeToRoot(Typography.Margin.body)))
            
            // MARK: Text

            let h1Style = ClassStyle(forClass: .notion(.page), withTag: .enclosing(.headings(.h1)))
                .font(size: .relativeToRootFontSize(Typography.Font.Size.title))
                .lineHeight(.number(Typography.LineHeight.title))
                .margin(top: .length(.relativeToRoot(Typography.Margin.title)))
            
            let h2Style = ClassStyle(forClass: .notion(.page), withTag: .enclosing(.headings(.h2)))
                .font(size: .relativeToRootFontSize(Typography.Font.Size.heading1))
                .font(weight: .number(600))
                .lineHeight(.number(Typography.LineHeight.heading))
                .margin(top: .length(.relativeToRoot(Typography.Margin.heading1)))
            
            let h3Style = ClassStyle(forClass: .notion(.page), withTag: .enclosing(.headings(.h3)))
                .font(size: .relativeToRootFontSize(Typography.Font.Size.heading2))
                .font(weight: .number(600))
                .lineHeight(.number(Typography.LineHeight.heading))
                .margin(top: .length(.relativeToRoot(Typography.Margin.heading2)))
            
            let h4Style = ClassStyle(forClass: .notion(.page), withTag: .enclosing(.headings(.h4)))
                .font(size: .relativeToRootFontSize(Typography.Font.Size.heading3))
                .font(weight: .number(600))
                .lineHeight(.number(Typography.LineHeight.heading))
                .margin(top: .length(.relativeToRoot(Typography.Margin.heading3)))

            let pStyle = ClassStyle(forClass: .notion(.page), withTag: .enclosing(.paragraph))
                .font(size: .relativeToRootFontSize(Typography.Font.Size.body))

            let linkStyle = ClassStyle(forClass: .notion(.page), withTag: .enclosing(.link))
                .foregroundVariable(.link_foreground)
                .textDecoration(.none)
            let linkHoverStyle = ClassStyle(.notion(.page), tag: .enclosing(.link), cssTag: .hover)
                .foregroundVariable(.link_foreground)
                .textDecoration(.underline)

            // MARK: Image

            let imageStyle = ClassStyle(forClass: .notion(.page), withTag: .selfClosing(.image))
                .display(.flex)
                .size(maxWidth: .percentage(100))
                .margin(
                    left: .auto,
                    top: .length(.relativeToRoot(Typography.Margin.heading1)),
                    right: .auto,
                    bottom: .length(.relativeToRoot(Typography.Margin.heading1))
                )
                .cornerRadius(uniform: .length(.relativeToRoot(Typography.Margin.subheading)))
            let imageCaptionStyle = ClassStyle(forClass: .notion(.page), withClass: .notion(.caption))
                .foregroundVariable(.nav_bar_active_item)
                .align(.center)
                .margin(
                    top: .length(.relativeToRoot(-Typography.Margin.heading2)),
                    bottom: .length(.relativeToRoot(Typography.Margin.heading1))
                )

            styles = [
                commonStyle,
                h1Style,
                h2Style,
                h3Style,
                h4Style,
                pStyle,
                linkStyle,
                linkHoverStyle,
                imageStyle,
                imageCaptionStyle
            ]
        case .small:
            let mediaStyles: CSSStyle = [
            ]
            
            styles = [MediaStyle(for: .small, with: mediaStyles)]
        }
        
        self.element = styles.map { $0.element }.joined(separator: "\n")
    }
}
