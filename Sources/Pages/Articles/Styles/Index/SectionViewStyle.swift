import HTMLDSL

// MARK: Wide

private let sectionViewOwnStyle = ClassStyle(forClass: .section)
    .size(width: .percentage(50))
    .centerX()

private let flexContainerStyle = ClassStyle(forClass: .flexContainer)
    .display(.flex)
    .flexWrap()
    .flex(gap: .length(.relativeToRoot(Typography.Margin.subheading)))

private let flexItemStyle = ClassStyle(forClass: .flexItem)

public let sectionViewStyle: [CSSStyle] = [sectionViewOwnStyle, flexContainerStyle, flexItemStyle]

// MARK: Small

private let sectionViewOwnStyleSmall = ClassStyle(forClass: .section)
    .size(width: .percentage(90))
    .centerX()

public let sectionViewStyleSmall: [CSSStyle] = [sectionViewOwnStyleSmall, flexContainerStyle, flexItemStyle]
