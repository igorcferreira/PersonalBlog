//
//  StoryContent.swift
//  IgniteStarter
//
//  Created by Igor Ferreira on 05/02/2026.
//
import Foundation
import Ignite

struct StoryContent: HTML {
    let article: Article
    let linkTitle: Bool
    
    init(article: Article, linkTitle: Bool = true) {
        self.article = article
        self.linkTitle = linkTitle
    }
    
    var body: some HTML {
        Card {
            if linkTitle {
                Text { Link(article) }
                    .font(.title1)
            } else {
                Text(article.title)
                    .font(.title1)
            }
            
            Text(article.date.formatted(date: .medium, time: .none, locale: article.locale))
            
            Text(article.text)
                .font(.body)
        }
        .style(.marginTop, "8pt")
        .style(.marginBottom, "8pt")
    }
}

private extension Date {
    /// Converts `self` to its textual representation that contains both the date and time parts. The exact format depends on the user's preferences.
    /// - Parameters:
    ///   - date: The style for describing the date part.
    ///   - time: The style for describing the time part.
    /// - Returns: A `String` describing `self`.
    func formatted(
        date: DateFormatter.Style,
        time: DateFormatter.Style,
        locale: Locale
    ) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = date
        formatter.timeStyle = time
        formatter.locale = locale
        return formatter.string(from: self)
    }
}
