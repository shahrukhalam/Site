import HTMLDSL

private let flexContainerOwnStyle = ClassStyle(forClass: .flexContainer)
    .display(.flex)
    .flexWrap()

private let flexItemStyle = ClassStyle(forClass: .flexItem)
    .margin(right: .pixel(16), bottom: .pixel(32))

public let flexContainerStyle: [CSSStyle] = [flexContainerOwnStyle, flexItemStyle]
