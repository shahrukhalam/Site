public struct Detail {
    public let description: Description
    public let image: ImageDescription
    public let link: LinkDescription

    public init(description: Description, image: ImageDescription, link: LinkDescription) {
        self.description = description
        self.image = image
        self.link = link
    }
}
