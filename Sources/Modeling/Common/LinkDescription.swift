public struct LinkDescription: Codable, Equatable {
    public let url: String
    public let text: String

    public init(url: String, text: String) {
        self.url = url
        self.text = text
    }
}
