import HTMLDSL

var commonCSSLinks: some HTMLContentView {
    AnyView([
        CSSLink(favicon: "/images/index/favicon.png"),
        CSSLink(appleTouchIcon: "/images/index/apple-touch-icon.png"),
        CSSLink(path: "https://fonts.googleapis.com/css?family=Poppins:wght@200..900&display=swap")
    ])
}
