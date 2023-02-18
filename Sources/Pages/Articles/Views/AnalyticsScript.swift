//
//  AnalyticsScript.swift
//  
//
//  Created by Shahrukh Alam on 21/08/22.
//

import HTMLDSL

struct AnalyticsScript: HTMLHeadContentView {
    let tag: Tag = .empty
    var attributes: [Attribute] = []

    private let id: String

    init(id: String) {
        self.id = id
    }
    
    var body: String {
        """
        <!-- Google tag (gtag.js) -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=G-\(id)"></script>
        <script>
          window.dataLayer = window.dataLayer || [];
          function gtag(){dataLayer.push(arguments);}
          gtag('js', new Date());

          gtag('config', 'G-\(id)');
        </script>
        """
    }
}
