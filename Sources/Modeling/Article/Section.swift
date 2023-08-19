import Foundation

public struct Section: Codable, Equatable, Identifiable {
    public var id: UUID { .init() }
    
    public let description: Description
    public let subsections: [Subsection]

    public init(description: Description, subsections: [Subsection]) {
        self.description = description
        self.subsections = subsections
    }
}
