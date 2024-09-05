@StyleBuilder
public func articleContainerStyle(_ mediaType: MediaStyle.DeviceType) -> some CSSStyle {
    switch mediaType {
    case .wide:
        ClassStyle(forClass: .articleContainer)
            .size(width: .percentage(50))
            .margin(left: .auto, right: .auto)
            .boxSize(.borderBox)

    case .small:
        MediaStyle(
            for: mediaType,
            with: ClassStyle(forClass: .articleContainer)
                .size(width: .percentage(100))
                .padding(
                    left: .length(.relativeToRoot(Typography.Margin.heading3)),
                    right: .length(.relativeToRoot(Typography.Margin.heading3))
                )
        )
    }
}
