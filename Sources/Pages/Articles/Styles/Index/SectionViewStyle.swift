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
public let indexContainerStyleSmall = ClassStyle(forClass: .indexContainer)
    .size(width: .percentage(90))
    .margin(
        left: .auto,
        top: .length(.relativeToRoot(Typography.Margin.title)),
        right: .auto,
        bottom: .length(.relativeToRoot(Typography.Margin.title))
    )





// MARK: Wide

private let sectionViewOwnStyle = ClassStyle(forClass: .section)

private let flexContainerStyle = ClassStyle(forClass: .flexContainer)
    .display(.flex)
    .flexWrap()
    .flex(gap: .length(.relativeToRoot(Typography.Margin.subheading)))

private let flexItemStyle = ClassStyle(forClass: .flexItem)

public let sectionViewStyle: [CSSStyle] = [sectionViewOwnStyle, flexContainerStyle, flexItemStyle]

// MARK: Small

private let sectionViewOwnStyleSmall = ClassStyle(forClass: .section)

public let sectionViewStyleSmall: [CSSStyle] = [sectionViewOwnStyleSmall, flexContainerStyle, flexItemStyle]
