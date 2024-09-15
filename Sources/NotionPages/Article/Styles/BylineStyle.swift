private let bylineContainerStyle = ClassStyle(forClass: .notion(.page), withClass: .bylineContainer)
    .display(.flex)
    .flexWrap()
    .flex(columnGap: .length(.relativeToRoot(Typography.Margin.subheading)))
    .flex(rowGap: .length(.relativeToRoot(Typography.Margin.byline)))

private let bylineParagraphStyle = ClassStyle(forClass: .notion(.page), withClass: .bylineParagraph)
        .foregroundVariable(.nav_bar_active_item)

private let bylineItemStyle = ClassStyle(forClass: .bylineItem)
let bylineStyle: [CSSStyle] = [bylineContainerStyle, bylineParagraphStyle]
