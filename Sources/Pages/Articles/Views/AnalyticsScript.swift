//
//  AnalyticsScript.swift
//  
//
//  Created by Shahrukh Alam on 21/08/22.
//

import HTMLDSL

public struct AnalyticsScript: HTMLHeadContentView {
    public let tag: Tag = .empty
    public var attributes: [Attribute] = []

    private let id: String

    public init(id: String) {
        self.id = id
    }
    
    public var body: String {
        """
        <!-- Google tag (gtag.js) -->
        <script defer src="https://www.googletagmanager.com/gtag/js?id=G-\(id)"></script>
        <script defer>
          window.dataLayer = window.dataLayer || [];
          function gtag(){dataLayer.push(arguments);}
          gtag('js', new Date());

          gtag('config', 'G-\(id)');
        </script>
        """
    }

//    var body: String {
//        """
//        <script type="module">
//        import { createApp } from 'https://unpkg.com/petite-vue@0.2.2/dist/petite-vue.es.js'
//
//        createApp({
//            methods: {
//                async fetchData() {
//                    const response = await fetch("https://api.zippopotam.us/in/600028")
//                    const data = await response.json()
//                }
//            },
//            mounted() {
//                this.fetchData()
//            }
//        })
//        .mount('#app')
//        </script>
//        """
//    }
}
