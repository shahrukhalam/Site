import HTMLDSL

public struct Filler {
    let content: AnyView
    let index: Int

    public init<Content>(_ content: Content, at index: Int) where Content: HTMLContentView {
        self.content = AnyView(content)
        self.index = index
    }
}
