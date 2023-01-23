public struct SectionHeader {
    public let description: Description
    public let hero: Detail
    public let grids: [(Detail, isHiddenInDesktop: Bool)]

    public init(description: Description, hero: Detail, grids: [(Detail, isHiddenInDesktop: Bool)]) {
        self.description = description
        self.hero = hero
        self.grids = grids
    }
}
