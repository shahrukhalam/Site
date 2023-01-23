//
//  NavView.swift
//  
//
//  Created by Shahrukh Alam on 09/08/22.
//

import HTMLDSL
import Modeling

struct NavView: HTMLBodyContentView {
    var tag: Tag = .empty
    var attributes = [Attribute]()
    
    private let tabs: [LinkDescription]
    private let selectedIndex: Int
    
    init(tabs: [LinkDescription], selectedIndex: Int) {
        self.tabs = tabs
        self.selectedIndex = selectedIndex
    }
    
    var body: some View {
        let tabViews = tabs.enumerated().map { (index, tab) in
            Link(text: tab.text, url: tab.url)
                .identifyBy(cssClass: selectedIndex == index ? .activeLink : .inactiveLink)
        }
        
        return Div {
            AnyView(tabViews)
            commonDivider
        }
        .identifyBy(cssClass: .indexNav)
    }
}
