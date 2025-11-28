//
//  ArticleListPageCSS.swift
//  
//
//  Created by Shahrukh Alam on 06/01/2023.
//

import HTMLDSL

func articleListPageCSS() -> some HTMLHeadContentView {
    HeadStyle {
        htmlDarkStyle
        htmlLightMediaStyle
        
        ArticleListStyle(.wide)
        ArticleListStyle(.small)
        
        RawCSSStyle(css: """
        /* Page Wrapper */
        .articlesPageWrapper { max-width: 1200px; margin: 0 auto; padding: 2rem 1rem; padding-top: 5rem; }
        
        /* Search Container - Full width at top */
        .articleSearchContainer { width: 100%; margin-bottom: 1rem; }
        .articleSearchInput { width: 100%; padding: 1rem; font-size: 1rem; border: 2px solid #e2e8f0; border-radius: 0.5rem; background: white; color: #2d3748; box-sizing: border-box; }
        .articleSearchInput:focus { outline: none; border-color: #667eea; box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1); }
        
        /* Main Layout with Sidebar */
        .articlesContentWithSidebar { display: flex; gap: 2rem; align-items: flex-start; }
        .articleListContainer { flex: 1; min-width: 0; overflow: hidden; }
        .articlesSidebar { flex: 0 0 250px; width: 250px; }
        
        /* Override article list width to be full width within container */
        .articlesPageWrapper .articleList { width: 100% !important; margin-left: 0 !important; margin-right: 0 !important; padding-top: 0 !important; }
        
        /* Search Results - Inside article list container */
        .articleSearchResults { display: none; width: 100%; box-sizing: border-box; }
        .articleSearchResultsContainer { display: flex; flex-direction: column; gap: 1.5rem; width: 100%; }
        
        /* Tags Sidebar */
        .tagsSection { background: white; padding: 1.5rem; border-radius: 0.75rem; box-shadow: 0 2px 8px rgba(0,0,0,0.1); position: sticky; top: 6rem; }
        .tagsSection h3 { margin-bottom: 1rem; font-size: 1.1rem; color: #2d3748; }
        .tagsContainer { display: flex; flex-direction: column; gap: 0.75rem; }
        .tagLink { padding: 0.5rem 0.75rem; background: #f7fafc; border-radius: 0.375rem; text-decoration: none; color: #4a5568; font-size: 0.9rem; transition: all 0.2s; display: block; cursor: pointer; }
        .tagLink:hover { background: #667eea; color: white; transform: translateX(4px); }
        .tagLinkActive { background: #667eea !important; color: white !important; font-weight: 600; }
        
        /* Dark Mode Support */
        @media (prefers-color-scheme: dark) {
            .articleSearchInput { background: #1a1a1a; border-color: #4a5568; color: #ffffff; }
            .articleSearchInput:focus { border-color: #667eea; }
            .tagsSection { background: #1a1a1a; }
            .tagsSection h3 { color: #ffffff; }
            .tagLink { background: #2d3748; color: #e2e8f0; }
            .tagLink:hover { background: #667eea; color: white; }
            .tagLinkActive { background: #667eea !important; color: white !important; }
        }
        
        /* Responsive */
        @media (max-width: 968px) {
            .articlesPageWrapper { padding-top: 4rem; }
            .articlesContentWithSidebar { flex-direction: column; }
            .articlesSidebar { flex: 1 1 auto; min-width: 100%; order: -1; }
            .tagsSection { position: static; margin-bottom: 1.5rem; }
            .tagsContainer { flex-direction: row; flex-wrap: wrap; }
            .tagLink { display: inline-block; }
        }
        """)
    }
}

private let htmlDarkStyle = TagStyle(for: .enclosing(.html))
    .backgroundImage(url: "/images/index/wave.jpg")
    .backgroundPosition(.center)
    .backgroundSize(.cover)

private let htmlLightStyle = TagStyle(for: .enclosing(.html))
    .backgroundImage(url: "/images/index/wave_light.jpg")
private let htmlLightMediaStyle = MediaStyle(for: .light, with: htmlLightStyle)
