//
//  Categories.swift
//  IgniteStarter
//
//  Created by Igor Ferreira on 03/02/2026.
//
import Foundation
import Ignite

struct Categories: LocalisedStaticPage {
    @Environment(\.decode) var decode
    @Environment(\.articles) var articles
    
    let locale: Locale
    var title: String {
        "Categories".localised(locale: locale, decoder: decode)
    }
    var map: [String: [Article]] {
        articles.categories(for: locale, decode: decode)
    }
    
    var body: some BodyElement {
        Accordion(map.keys, content: { key in
            Item(key, startsOpen: true) {
                Card {
                    List {
                        ForEach(map[key] ?? []) { article in
                            Link(article)
                        }
                    }
                    .listStyle(.plain)
                }
            }
        })
    }
}

extension Article {
    var category: String? {
        metadata["category"] as? String
    }
}

extension ArticleLoader {
    func typed(_ type: String, locale: Locale) -> [Article] {
        self.in(locale: locale).filter { $0.type == type }
    }

    func tagged(_ tag: String, locale: Locale) -> [Article] {
        self.in(locale: locale).filter { $0.tags?.contains(tag) == true }
    }
    
    func of(category: String, locale: Locale) -> [Article] {
        self.in(locale: locale).filter { $0.category == category }
    }
    
    func categories(for locale: Locale, decode: DecodeAction) -> [String: [Article]] {
        let tags = Set(self.in(locale: locale).compactMap { article in article.category })
        var map = [String: [Article]]()
        tags.forEach { category in
            map[category.localised(locale: locale, decoder: decode)] = of(category: category, locale: locale)
        }
        return map
    }
}
