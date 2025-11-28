public struct HomeSponsor: Equatable, Hashable {
    public let name: String
    public let url: String
    public let imageURL: String
    public let description: String
    
    public init(name: String, url: String, imageURL: String, description: String) {
        self.name = name
        self.url = url
        self.imageURL = imageURL
        self.description = description
    }
}

