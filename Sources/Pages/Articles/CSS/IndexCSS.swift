import HTMLDSL

var indexPageCSS: some HTMLHeadContentView {
    HeadStyle {
        indexContainerStyle
        MediaStyle(for: .small, with: indexContainerStyleSmall)

        sectionViewStyle

        gridContainerStyleIndex
        MediaStyle(for: .small, with: gridContainerSmallStyleIndex)
    }
}
