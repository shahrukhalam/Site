import HTMLDSL

// MARK: Wide

private let sectionViewOwnStyle = ClassStyle(forClass: .section)
    .size(width: .percentage(50))
    .centerX()

private let flexContainerStyle = ClassStyle(forClass: .flexContainer)
    .display(.flex)
    .flexWrap()

private let flexItemStyle = ClassStyle(forClass: .flexItem)
    .margin(right: .pixel(16), bottom: .pixel(32))

public let sectionViewStyle: [CSSStyle] = [sectionViewOwnStyle, flexContainerStyle, flexItemStyle]

// MARK: Small

private let sectionViewOwnStyleSmall = ClassStyle(forClass: .section)
    .size(width: .percentage(90))
    .centerX()

public let sectionViewStyleSmall: [CSSStyle] = [sectionViewOwnStyleSmall, flexContainerStyle, flexItemStyle]
