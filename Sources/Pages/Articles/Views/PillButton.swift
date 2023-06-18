import HTMLDSL

public struct PillButton: HTMLBodyContentView {
    public let tag: Tag = .enclosing(.div)
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
            .cornerRadius(.pixel(1000)) /// Big radius makes pill shape
    }
}
