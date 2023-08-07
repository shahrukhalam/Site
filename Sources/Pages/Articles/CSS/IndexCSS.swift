import HTMLDSL

var indexPageCSS: some HTMLHeadContentView {
    HeadStyle {
        MediaStyle(for: .wide, with: indexContainerStyle)
        MediaStyle(for: .small, with: indexContainerStyleSmall)

        MediaStyle(for: .wide, with: sectionViewStyle)
        MediaStyle(for: .small, with: sectionViewStyleSmall)

        MediaStyle(for: .wide, with: gridContainerStyleIndex)
        MediaStyle(for: .small, with: gridContainerSmallStyleIndex)
    }
}
