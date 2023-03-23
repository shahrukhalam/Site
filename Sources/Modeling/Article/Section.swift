public struct Section: Codable {
    public let description: Description
    public let subsections: [Subsection]

    public init(description: Description, subsections: [Subsection]) {
        self.description = description
        self.subsections = subsections
    }
}
