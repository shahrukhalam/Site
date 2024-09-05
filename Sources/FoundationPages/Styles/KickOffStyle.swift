public struct KickOffStyle: CSSStyle {
    public let key: CustomStringConvertible = Tag.empty.description
    public let styles = [Style]()

    public var element: String

    public init() {
        let pageStyle = PageStyle()
            .margin()
            .padding()
        self.element = pageStyle.element
    }
}
