//
//  MarkdownParser.swift
//
//
//  Created by Shahrukh Alam on 07/01/2023.
//

import Foundation
import Parsing

let newLine = "\n"
let emptyNewLine = "\n\n"

public let titleParser = Parse {
    "# "
    Prefix { $0 != "\n" }
}

public let createdOnParser = Parse {
    "Created: "
    Prefix { $0 != "\n" }
        .map(.string)
        .map { value in
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = "MMMM d, yyyy hh:mm a"
            return formatter.date(from: value)
        }
}

public let tagsParser = Parse {
    "Tags: "
    Prefix { $0 != "\n" }
        .map(.string)
        .map { $0.split(separator: ", ") }
}

public let estimatedTimeParser = Parse {
    "Estimated Time: "
    Prefix { $0 != "\n" }
}

public let headerImageURLParser = Parse {
    "Header Image URL: "
    Prefix { $0 != "\n" }
        .map(.string)
        .map(URL.init(string:))
}

public let markdownParser = Parse {
    titleParser
    newLine
    newLine
    
    createdOnParser
    newLine
    
    tagsParser
    newLine
    
    estimatedTimeParser
    newLine
    
    headerImageURLParser
    newLine
    newLine
    
    Skip { Prefix(1...) }
}
