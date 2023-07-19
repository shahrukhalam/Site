import HTMLDSL

public struct PillButton: HTMLBodyContentView {
    public let tag: Tag = .empty
    public var attributes = [Attribute]()
    
    public let text: String
    public let url: String
    
    public init(text: String, url: String) {
        self.text = text
        self.url = url
    }
    
    public var body: some View {
        Link(text: text, url: url)
            .identifyBy(cssClass: .pillLink)
            .padding(left: .pixel(16), top: .pixel(8), right: .pixel(16), bottom: .pixel(8))
        /// Big radius makes pill shape
            .cornerRadius(.pixel(1000))
        /// `a` is an inline element, which does not have vertical layout or affect other elements in the DOM vertically.
        /// To give an `a` element vertical layout, so it can affect elements around it vertically,
        /// make the element `display: block;` or `display: inline-block;` depending on your needs.
        /// Ref: https://stackoverflow.com/a/41516453
            .display(.inlineBlock)
    }
}
