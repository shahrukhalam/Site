struct ArticleContentStyle: CSSStyle {
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

            let introStyle = ClassStyle(forClass: .notion(.page), withClass: .notion(.intro))
                .font(size: .relativeToRootFontSize(Typography.Font.Size.subheading))
                .font(weight: .number(300))
                .lineHeight(.number(Typography.LineHeight.subheading))
                .foregroundVariable(.note_border)
                .margin(top: .length(.relativeToRoot(Typography.Margin.subheading)))

            let captionStyle = ClassStyle(forClass: .notion(.page), withClass: .notion(.caption))
                .foregroundVariable(.nav_bar_active_item)
                .align(.center)
                .margin(
                    top: .length(.relativeToRoot(-Typography.Margin.heading2)),
                    bottom: .length(.relativeToRoot(Typography.Margin.heading1))
                )

            let linkStyle = ClassStyle(forClass: .notion(.page), withTag: .enclosing(.link))
                .foregroundVariable(.link_foreground)
                .textDecoration(.none)
            let linkHoverStyle = ClassStyle(.notion(.page), tag: .enclosing(.link), cssTag: .hover)
                .foregroundVariable(.link_foreground)
                .textDecoration(.underline)

            // MARK: Image

            let imageStyle = ClassStyle(forClass: .notion(.page), withTag: .selfClosing(.image))
                .display(.flex)
                .size(maxWidth: .percentage(100), maxHeight: .percentageViewPortWidth(50))
                .margin(
                    left: .auto,
                    top: .length(.relativeToRoot(Typography.Margin.heading1)),
                    right: .auto,
                    bottom: .length(.relativeToRoot(Typography.Margin.heading1))
                )
                .cornerRadius(uniform: .length(.relativeToRoot(Typography.Margin.subheading)))

            // MARK: Video

            let videoStyle = ClassStyle(forClass: .notion(.page), withTag: .enclosing(.video))
                .display(.flex)
                .size(
                    minHeight: .percentageViewPortWidth(10),
                    maxWidth: .percentage(100),
                    maxHeight: .percentageViewPortWidth(50)
                )
                .margin(
                    left: .auto,
                    top: .length(.relativeToRoot(Typography.Margin.heading1)),
                    right: .auto,
                    bottom: .length(.relativeToRoot(Typography.Margin.heading1))
                )
                .cornerRadius(uniform: .length(.relativeToRoot(Typography.Margin.subheading)))

            // MARK: iFrame

            let iframeContainerStyle = ClassStyle(forClass: .notion(.iframe_container))
                .margin(
                    left: .auto,
                    top: .length(.relativeToRoot(Typography.Margin.heading1)),
                    right: .auto,
                    bottom: .length(.relativeToRoot(Typography.Margin.heading1))
                )
                .padding(
                    // https://www.w3schools.com/howto/howto_css_responsive_iframes.asp
                    // To have 16:9 Aspect Ratio (divide 9 by 16 = 0.5625)
                    top: .percentage(56.25)
                )
                .position(.relative)
                .size(width: .percentage(100))
                .backgroundVariable(.note_background)
                .cornerRadius(uniform: .pixel(10))

            let iframeContainerStyleForPodcast = ClassStyle(forClass: .notion(.iframe_container_podcast))
                .margin(
                    top: .length(.relativeToRoot(Typography.Margin.heading1)),
                    bottom: .length(.relativeToRoot(Typography.Margin.heading1))
                )
                .padding(
                    top: .pixel(175)
                )
                .position(.relative)
                .size(width: .percentage(100))
                .backgroundVariable(.note_background)
                .cornerRadius(uniform: .pixel(10))

            let iframeStyle = ClassStyle(forClass: .notion(.page), withClass: .notion(.iframe))
                .position(.absolute)
                .constraint(left: .pixel(0), top: .pixel(0), right: .pixel(0), bottom: .pixel(0))
                .sizeFull()
                .margin()
                .cornerRadius(uniform: .pixel(10))

            // MARK: Divider

            let dividerStyle = ClassStyle(forClass: .notion(.page), withTag: .enclosing(.hr))
                .margin(
                    top: .length(.relativeToRoot(Typography.Margin.heading3)),
                    bottom: .length(.relativeToRoot(Typography.Margin.heading1))
                )
                .backgroundVariable(.nav_bar_divider)
                .size(height: .pixel(1))
                .border(width: .pixel(0))

            // MARK: Quote

            let quoteAndAuthorContainerStyle = ClassStyle(forClass: .notion(.quote_author_container))
                .margin()
                .display(.flex)
                .flexAlign(.center)
            let quoteContainerStyle = ClassStyle(forClass: .notion(.quote_container))
                .margin()
                .font(family: .serif([.AmericanTypewriter]))
                .display(.inlineFlex)
                .flexDirection(.vertical)
            let quoteStyle = ClassStyle(forClass: .notion(.page), withClass: .notion(.quote))
                .font(size: .relativeToRootFontSize(Typography.Font.Size.heading2))
                .font(weight: .lighter)
                .margin()
            let quoteAuthorStyle = ClassStyle(forClass: .notion(.page), withClass: .notion(.quote_author))
                .font(size: .relativeToRootFontSize(Typography.Font.Size.byline))
                .font(weight: .number(Typography.Font.Weight.byline))
                .align(.right)
                .margin(
                    top: .length(.relativeToRoot(Typography.Margin.byline))
                )

            // MARK: Code

            let codeStyle = ClassStyle(
                forClass: .notion(.code_inline)
            )
                .padding(
                    left: .pixel(4),
                    top: .pixel(2),
                    right: .pixel(4),
                    bottom: .pixel(2)
                )
                .backgroundVariable(.code_background)
                .foregroundVariable(.code_foreground)
                .cornerRadius(uniform: .pixel(2))

            // MARK: Callout

            let calloutContainerStyle = ClassStyle(forClass: .notion(.page), withClass: .notion(.callout_container))
                .margin(
                    top: .length(.relativeToRoot(Typography.Margin.heading1)),
                    bottom: .length(.relativeToRoot(Typography.Margin.heading1))
                )
                .padding(
                    left: .length(.relativeToRoot(Typography.Margin.heading1)),
                    top: .length(.relativeToRoot(Typography.Margin.heading2)),
                    right: .length(.relativeToRoot(Typography.Margin.heading2)),
                    bottom: .length(.relativeToRoot(Typography.Margin.heading2))
                )
                .cornerRadius(uniform: .pixel(20))

            let calloutStyle = ClassStyle(forClass: .notion(.page), withClass: .notion(.callout))
                .font(size: .relativeToRootFontSize(Typography.Font.Size.body))
                .margin(top: .pixel(0))

            // MARK: Callout/Note

            let calloutNoteContainerStyle = ClassStyle(forClass: .notion(.callout_note_container))
                .backgroundVariable(.note_background)
                .border(width: .pixel(1), color: Color.variable(CSSVariable.note_border.name))
            let calloutNoteStyle = ClassStyle(forClass: .notion(.page), withClass: .notion(.callout_note))
                .foregroundVariable(.note_border)

            // MARK: Callout/Important

            let calloutImportantContainerStyle = ClassStyle(forClass: .notion(.callout_important_container))
                .backgroundVariable(.important_background)
                .border(width: .pixel(1), color: Color.variable(CSSVariable.important_border.name))
            let calloutImportantStyle = ClassStyle(forClass: .notion(.page), withClass: .notion(.callout_important))
                .foregroundVariable(.important_border)

            // MARK: Callout/Warning

            let calloutWarningContainerStyle = ClassStyle(forClass: .notion(.callout_warning_container))
                .backgroundVariable(.warning_background)
                .border(width: .pixel(1), color: Color.variable(CSSVariable.warning_border.name))
            let calloutWarningStyle = ClassStyle(forClass: .notion(.page), withClass: .notion(.callout_warning))
                .foregroundVariable(.warning_border)

            // MARK: Callout/Tip

            let calloutTipContainerStyle = ClassStyle(forClass: .notion(.callout_tip_container))
                .backgroundVariable(.tip_background)
                .border(width: .pixel(1), color: Color.variable(CSSVariable.tip_border.name))
            let calloutTipStyle = ClassStyle(forClass: .notion(.page), withClass: .notion(.callout_tip))
                .foregroundVariable(.tip_border)

            // MARK: List
            
            let ulStyle = ClassStyle(forClass: .notion(.page), withTag: .enclosing(.unorderedList))
                .font(size: .relativeToRootFontSize(Typography.Font.Size.body))
                .margin(left: .length(.relativeToRoot(Typography.Margin.heading1)))

            let olStyle = ClassStyle(forClass: .notion(.page), withTag: .enclosing(.orderedList))
                .font(size: .relativeToRootFontSize(Typography.Font.Size.body))
                .margin(left: .length(.relativeToRoot(Typography.Margin.heading1)))

            styles = [
                calloutContainerStyle,
                calloutStyle,
                calloutNoteContainerStyle,
                calloutNoteStyle,
                calloutImportantContainerStyle,
                calloutImportantStyle,
                calloutWarningContainerStyle,
                calloutWarningStyle,
                calloutTipContainerStyle,
                calloutTipStyle,
                codeStyle,
                commonStyle,
                dividerStyle,
                h1Style,
                h2Style,
                h3Style,
                h4Style,
                iframeContainerStyle,
                iframeContainerStyleForPodcast,
                iframeStyle,
                introStyle,
                pStyle,
                captionStyle,
                linkStyle,
                linkHoverStyle,
                imageStyle,
                videoStyle,
                quoteAndAuthorContainerStyle,
                quoteContainerStyle,
                quoteStyle,
                quoteAuthorStyle,
                ulStyle,
                olStyle
            ]
        case .small:
            // MARK: Image

            let imageStyle = ClassStyle(forClass: .notion(.page), withTag: .selfClosing(.image))
                .size(maxWidth: .percentage(100), maxHeight: .percentageViewPortWidth(100))

            // MARK: Video

            let videoStyle = ClassStyle(forClass: .notion(.page), withTag: .enclosing(.video))
                .size(
                    minHeight: .percentageViewPortWidth(25),
                    maxWidth: .percentage(100),
                    maxHeight: .percentageViewPortWidth(100)
                )

            let mediaStyles: CSSStyle = [
                imageStyle,
                videoStyle
            ]

            styles = [MediaStyle(for: .small, with: mediaStyles)]
        }

        self.element = styles.map { $0.element }.joined(separator: "\n")
    }
}
