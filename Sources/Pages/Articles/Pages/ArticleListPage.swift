//
//  ArticleListPage.swift
//  
//
//  Created by Shahrukh Alam on 06/01/2023.
//

import HTMLDSL
import Modeling
import Foundation

// Simple struct for JavaScript article data
private struct ArticleData: Codable {
    let title: String
    let intro: String
    let url: String
    let tags: [String]
    let bannerUrl: String
    let bannerDescription: String
}

public func articleListPage(tabs: [LinkDescription], selectedIndex: Int, articles: [Article], meta: MetaDetail, analyticsID: String?) -> some View {
    return Document {
        HTML {
            Head {
                commonMeta(meta)
                
                commonCSSLinks
                
                commonCSS(page: .articleList, isApp: false)
                articleListPageCSS()
                
                if let analyticsID = analyticsID {
                    AnalyticsScript(id: analyticsID)
                }
            }

            Body {
                NavView(tabs: tabs, selectedIndex: selectedIndex)
                
                // Main wrapper
                Div {
                    // Search input at the top
                    Div {
                        AnyView("""
                        <input type="text" id="articleSearch" class="articleSearchInput" placeholder="Search articles by title or tags..." />
                        """)
                    }
                    .identifyBy(cssClass: .articleSearchContainer)
                    
                    // Main content with sidebar
                    Div {
                        // Article list container
                        Div {
                            // Search results (hidden by default, shown when searching)
                            Div {
                                Div {
                                    AnyView("<!-- Search results will be populated here by JavaScript -->")
                                }
                                .identifyBy(cssClass: .articleSearchResultsContainer)
                            }
                            .identifyBy(cssClass: .articleSearchResults)
                            
                            // Main article list
                            Div {
                                AnyView(articles.map { article in
                                    ArticleListCell(article: article)
                                })
                            }
                            .identifyBy(cssClass: .articleList)
                        }
                        .identifyBy(cssClass: .articleListContainer)
                        
                        // Tags sidebar
                        Div {
                            tagsSidebar(articles: articles)
                        }
                        .identifyBy(cssClass: .articlesSidebar)
                    }
                    .identifyBy(cssClass: .articlesContentWithSidebar)
                }
                .identifyBy(cssClass: .articlesPageWrapper)
                
                // Combined JavaScript for article data, search and filter
                Script(command: combinedArticleScript(articles: articles))
            }
            .padding(uniform: .pixel(0))
            .sizeFull()
            .backgroundColor(.transparent)
        }
    }
}

func tagsSidebar(articles: [Article]) -> some HTMLBodyContentView {
    // Extract unique tags from articles
    let allArticleTags = Set(articles.flatMap { $0.detail.tags })
    let sortedTags = Array(allArticleTags).sorted()
    
    return Div {
        Headings("Browse by Tags", type: .h3)
            .margin(bottom: .length(.relativeToRoot(Typography.Margin.body)))
        
        Div {
            AnyView(sortedTags.map { tagName in
                AnyView("""
                <div class="tagLink" data-tag="\(tagName)" style="cursor: pointer;">\(tagName)</div>
                """)
            })
        }
        .identifyBy(cssClass: .tagsContainer)
    }
    .identifyBy(cssClass: .tagsSection)
}

func combinedArticleScript(articles: [Article]) -> String {
    let articleData = articles.map { article in
        ArticleData(
            title: article.detail.title,
            intro: article.detail.intro,
            url: article.relativeURL,
            tags: article.detail.tags,
            bannerUrl: article.detail.banner.url,
            bannerDescription: article.detail.banner.description
        )
    }
    
    guard let jsonData = try? JSONEncoder().encode(articleData),
          let jsonString = String(data: jsonData, encoding: .utf8) else {
        return "console.error('Failed to encode article data');"
    }
    
    // Escape single quotes and newlines for JavaScript
    let escapedJson = jsonString
        .replacingOccurrences(of: "\\", with: "\\\\")
        .replacingOccurrences(of: "'", with: "\\'")
        .replacingOccurrences(of: "\n", with: "\\n")
    
    return """
    (function() {
        // Embed article data
        window.articleData = JSON.parse('\(escapedJson)');
        
        // Search and Filter functionality
        const searchInput = document.getElementById('articleSearch');
        const articleList = document.querySelector('.articleList');
        const searchResults = document.querySelector('.articleSearchResults');
        const searchResultsContainer = document.querySelector('.articleSearchResultsContainer');
        const tagLinks = document.querySelectorAll('.tagLink');
        
        if (!searchInput || !articleList || !searchResults || !searchResultsContainer) {
            console.error('Required elements not found');
            return;
        }
        
        let currentFilterTag = null;
        let currentSearchQuery = '';
        
        // Render articles to HTML
        function escapeHtml(text) {
            const div = document.createElement('div');
            div.textContent = text;
            return div.innerHTML;
        }
        
        function renderArticle(article) {
            const title = escapeHtml(article.title || '');
            const intro = escapeHtml(article.intro || '');
            const url = escapeHtml(article.url || '#');
            const bannerUrl = escapeHtml(article.bannerUrl || '/images/placeholder.jpg');
            const bannerAlt = escapeHtml(article.bannerDescription || article.title || '');
            
            return '<div class="gridContainerArticleList">' +
                '<div class="gridItem1By3ArticleList">' +
                '<div>' +
                '<img src="' + bannerUrl + '" alt="' + bannerAlt + '" style="width: 100%; aspect-ratio: 16/9; object-fit: cover; border-radius: 8px;" />' +
                '</div>' +
                '</div>' +
                '<div class="gridItem2By3ArticleList">' +
                '<div>' +
                '<a href="' + url + '" class="link">' + title + '</a>' +
                '</div>' +
                '<h4>' + intro + '</h4>' +
                '</div>' +
                '</div>';
        }
        
        // Filter articles based on search query and tag
        function filterArticles() {
            const query = currentSearchQuery.toLowerCase().trim();
            const filtered = window.articleData.filter(function(article) {
                // Check tag filter
                if (currentFilterTag && !article.tags.includes(currentFilterTag)) {
                    return false;
                }
                
                // Check search query
                if (query === '') {
                    return true;
                }
                
                const title = (article.title || '').toLowerCase();
                const tags = (article.tags || []).join(' ').toLowerCase();
                
                return title.includes(query) || tags.includes(query);
            });
            
            return filtered;
        }
        
        // Update search results display
        function updateSearchResults() {
            const filtered = filterArticles();
            
            if (currentSearchQuery !== '') {
                // Show search results, hide main article list
                searchResults.style.display = 'block';
                searchResultsContainer.innerHTML = filtered.map(renderArticle).join('');
                articleList.style.display = 'none';
            } else {
                // Hide search results, show main article list
                searchResults.style.display = 'none';
                searchResultsContainer.innerHTML = '';
                articleList.style.display = '';
                updateMainList();
            }
        }
        
        // Update main article list based on tag filter
        function updateMainList() {
            if (currentFilterTag === null) {
                // Show all articles
                Array.from(articleList.children).forEach(function(articleEl) {
                    articleEl.style.display = '';
                });
            } else {
                // Filter by tag
                Array.from(articleList.children).forEach(function(articleEl) {
                    const link = articleEl.querySelector('a.link');
                    if (!link) {
                        articleEl.style.display = 'none';
                        return;
                    }
                    
                    // Find matching article data
                    const articleUrl = link.getAttribute('href');
                    const article = window.articleData.find(function(a) {
                        return a.url === articleUrl;
                    });
                    
                    if (article && article.tags.includes(currentFilterTag)) {
                        articleEl.style.display = '';
                    } else {
                        articleEl.style.display = 'none';
                    }
                });
            }
        }
        
        // Search input handler
        searchInput.addEventListener('input', function(e) {
            currentSearchQuery = e.target.value;
            updateSearchResults();
        });
        
        // Tag click handlers
        tagLinks.forEach(function(tagLink) {
            tagLink.addEventListener('click', function(e) {
                e.preventDefault();
                
                const tag = this.getAttribute('data-tag');
                
                // Toggle tag selection
                if (currentFilterTag === tag) {
                    // Deselect
                    currentFilterTag = null;
                    this.classList.remove('tagLinkActive');
                } else {
                    // Select new tag
                    currentFilterTag = tag;
                    tagLinks.forEach(function(link) {
                        link.classList.remove('tagLinkActive');
                    });
                    this.classList.add('tagLinkActive');
                }
                
                // Clear search when filtering by tag
                if (currentSearchQuery === '') {
                    updateMainList();
                } else {
                    updateSearchResults();
                }
            });
        });
        
        // Initialize - show all articles
        updateMainList();
    })();
    """
}
