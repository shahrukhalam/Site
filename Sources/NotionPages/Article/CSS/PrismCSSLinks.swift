var prismCSSLinks: some HTMLHeadContentView {
    AnyView([
        /// Loading CSS based on any `media` query expression
        /// seems to be out of specification for the media attribute.
        /// https://www.w3schools.com/tags/att_link_media.asp
        CSSLink(path: "/css/prism-dark.css"),
        CSSLink(path: "/css/prism-light.css"),
        CSSLink(path: "/css/prism-override.css")
    ])
}
