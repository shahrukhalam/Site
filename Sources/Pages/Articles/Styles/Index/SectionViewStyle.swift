import HTMLDSL

/// IndexContainerStyle
public let indexContainerStyle = ClassStyle(forClass: .indexContainer)
    .size(width: .percentage(50))
    .margin(
        left: .auto,
        top: .length(.relativeToRoot(Typography.Margin.title)),
        right: .auto,
        bottom: .length(.relativeToRoot(Typography.Margin.title))
    )
    /// To make footer stay at the bottom
    /// https://philipwalton.github.io/solved-by-flexbox/demos/sticky-footer/
    .flex(value: 1)
public let indexContainerStyleSmall = ClassStyle(forClass: .indexContainer)
    .size(width: .percentage(90))

/// Section & Tags
private let flexContainerStyle = ClassStyle(forClass: .flexContainer)
    .display(.flex)
    .flexWrap()
    .flex(gap: .length(.relativeToRoot(Typography.Margin.subheading)))
public let sectionViewStyle: [CSSStyle] = [flexContainerStyle]
