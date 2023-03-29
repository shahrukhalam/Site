public struct MetaDetail {
    public let title: String
    public let description: String
    public let keywords: Set<String>
    public let socialImage: String
    public let url: String

    public init(title: String, description: String, keywords: Set<String>, socialImage: String, url: String) {
        self.title = title
        self.description = description
        self.keywords = keywords
        self.socialImage = socialImage
        self.url = url
    }
}
