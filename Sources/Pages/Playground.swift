//
//  Playground.swift
//  
//
//  Created by Shahrukh Alam on 03/01/2023.
//

import HTMLDSL

#if os(macOS)
import SwiftUI
import WebKit

struct WebView<Content: HTMLDSL.View>: NSViewRepresentable {
    let content: Content

    func makeNSView(context: Context) -> WKWebView {
        WKWebView()
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        nsView.loadHTMLString(content.element, baseURL: nil)
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some SwiftUI.View {
        WebView(content: content)
    }
}
#endif

fileprivate let content = Document {
    HTML {
        Head {
            HeadStyle {
                MediaStyle(for: .wide, with: fontStyles)
                MediaStyle(for: .small, with: fontStylesSmall)
            }
        }

        Body {
            Div {
                Headings("Title", type: .h1)
                    .identifyBy(cssClass: .title1)
                Image("http://127.0.0.1:8080/images/index/swift.png", alternateText: "Swift logo")
                    .size(width: .percentage(100))
                    .cornerRadius(.pixel(4))
                Headings("Subtitle", type: .h4)
                    .identifyBy(cssClass: .callout)
            }
        }
    }
}
