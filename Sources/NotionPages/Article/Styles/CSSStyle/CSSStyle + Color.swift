extension CSSStyle {
    private func index(colorScheme: HTMLDSL.ColorScheme) -> CSSStyle {
        self
            .variable(color: .index_background, scheme: colorScheme)
            .variable(color: .index_foreground, scheme: colorScheme)
    }

    private func link(colorScheme: HTMLDSL.ColorScheme) -> CSSStyle {
        self
            .variable(color: .link_foreground, scheme: colorScheme)
    }

    private func navBar(colorScheme: HTMLDSL.ColorScheme) -> CSSStyle {
        self
            .variable(color: .nav_bar_background, scheme: colorScheme)
            .variable(color: .nav_bar_active_item, scheme: colorScheme)
            .variable(color: .nav_bar_inactive_item, scheme: colorScheme)
            .variable(color: .nav_bar_hover_item, scheme: colorScheme)
            .variable(color: .nav_bar_divider, scheme: colorScheme)
    }
    
    func article(colorScheme: HTMLDSL.ColorScheme) -> CSSStyle {
        self
            .articleLite(colorScheme: colorScheme)
            .navBar(colorScheme: colorScheme)
    }
    
    func articleLite(colorScheme: HTMLDSL.ColorScheme) -> CSSStyle {
        self
            .index(colorScheme: colorScheme)
            .link(colorScheme: colorScheme)
            .code(colorScheme: colorScheme)
            .variable(color: .code_block_background, scheme: colorScheme)
            .variable(color: .code_block_type, scheme: colorScheme)
            .variable(color: .code_block_keyword, scheme: colorScheme)
            .variable(color: .code_block_string, scheme: colorScheme)
            .variable(color: .code_block_number, scheme: colorScheme)
            .variable(color: .note_background, scheme: colorScheme)
            .variable(color: .note_border, scheme: colorScheme)
            .variable(color: .warning_background, scheme: colorScheme)
            .variable(color: .warning_border, scheme: colorScheme)
            .variable(color: .important_background, scheme: colorScheme)
            .variable(color: .important_border, scheme: colorScheme)
            .variable(color: .tip_background, scheme: colorScheme)
            .variable(color: .tip_border, scheme: colorScheme)
            .variable(color: .table_border, scheme: colorScheme)
    }
    
    private func code(colorScheme: HTMLDSL.ColorScheme) -> CSSStyle {
        self
            .variable(color: .code_background, scheme: colorScheme)
            .variable(color: .code_foreground, scheme: colorScheme)
    }
    
    private func _404(colorScheme: HTMLDSL.ColorScheme) -> CSSStyle {
        self
            .index(colorScheme: colorScheme)
            .navBar(colorScheme: colorScheme)
            .variable(color: .background_404, scheme: colorScheme)
            .variable(color: .title_404, scheme: colorScheme)
            .variable(color: .subtitle_404, scheme: colorScheme)
    }
}
