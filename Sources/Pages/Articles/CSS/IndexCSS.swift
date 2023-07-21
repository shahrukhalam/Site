import HTMLDSL

var indexPageCSS: some HTMLHeadContentView {
    HeadStyle {
        MediaStyle(for: .wide, with: sectionViewStyle)
        MediaStyle(for: .small, with: sectionViewStyleSmall)
        
        MediaStyle(for: .wide, with: sectionHeaderStyle)        
        MediaStyle(for: .wide, with: sectionHeaderContentStyle)
        MediaStyle(for: .wide, with: sectionHeaderHeroSmallStyle)

        MediaStyle(for: .wide, with: gridContainerStyle)
        MediaStyle(for: .small, with: gridContainerSmallStyle)
    }
}
