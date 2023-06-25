import HTMLDSL

var indexPageCSS: some HTMLHeadContentView {
    HeadStyle {
        MediaStyle(for: .wide, with: sectionViewStyle)
        MediaStyle(for: .small, with: sectionViewStyleSmall)
    }
}
