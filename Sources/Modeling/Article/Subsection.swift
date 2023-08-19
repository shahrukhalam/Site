import Foundation

public struct Subsection {
    public let detail: Detail
    public let layout: Layout
    public let device: DeviceType
    public let tag: Article.Detail.SubsectionTag
    
    public init(detail: Detail, layout: Layout, device: DeviceType, tag: Article.Detail.SubsectionTag) {
        self.detail = detail
        self.layout = layout
        self.device = device
        self.tag = tag
    }
}
