public struct Subsection: Codable {
    public let detail: Detail
    public let layout: Layout
    public let device: DeviceType
    
    public init(detail: Detail, layout: Layout, device: DeviceType) {
        self.detail = detail
        self.layout = layout
        self.device = device
    }
}
