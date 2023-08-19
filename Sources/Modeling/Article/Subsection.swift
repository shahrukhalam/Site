import Foundation

public struct Subsection: Codable, Equatable, Identifiable {
    public var id: UUID { .init() }

    public let detail: Detail
    public let layout: Layout
    public let device: DeviceType
    public let tag: Article.Detail.SubSectionTag
    
    public init(detail: Detail, layout: Layout, device: DeviceType, tag: Article.Detail.SubSectionTag) {
        self.detail = detail
        self.layout = layout
        self.device = device
        self.tag = tag
    }
}
