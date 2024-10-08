extension Array: CSSStyle where Element == CSSStyle {
    public var key: CustomStringConvertible { Tag.empty.description }
    public var styles: [Style] { [] }
    public var element: String { map { $0.element }.joined(separator: "\n") }
}
