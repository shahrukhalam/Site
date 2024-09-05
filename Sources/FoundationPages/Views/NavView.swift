public struct NavView: HTMLBodyContentView {
    public var tag: Tag = .empty
    public var attributes = [Attribute]()

    private let tabs: [LinkDescription]
    private let selectedIndex: Int

    public init(tabs: [LinkDescription], selectedIndex: Int) {
        self.tabs = tabs
        self.selectedIndex = selectedIndex
    }

    public var body: some View {
        let tabViews = tabs.enumerated().map { (index, tab) in
            Link(text: tab.text, url: tab.url)
                .target(.sameWindowOrTab)
                .identifyBy(cssClass: selectedIndex == index ? .activeLink : .inactiveLink)
        }

        return Div {
            AnyView(tabViews)
            commonDivider
        }
        .identifyBy(cssClass: .indexNav)
    }
}
