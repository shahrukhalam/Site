//
//  MarkdownParser.swift
//  
//
//  Created by Shahrukh Alam on 07/01/2023.
//

import Parsing

let newLine = "\n\n"

public let titleParser = Parse {
    "# "
    Prefix { $0 != "\n" }
}

public let introParser = Parse {
    "<p class=\"intro\">"
    Prefix { $0 != "<" }
    "</p>"
}

public let bannerAlternateParser = Parse {
    "!["
    Prefix { $0 != "]" }
    "]"
}

public let bannerSourceParser = Parse {
    "("
    Prefix { $0 != ")" }
    ")"
}

public let markdownParser = Parse {
    titleParser
    newLine
    introParser
    newLine
    Parse {
        bannerAlternateParser
        bannerSourceParser
    }
    Skip { Prefix(1...) }
}
