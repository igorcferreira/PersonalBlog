import Foundation
import Ignite

struct Home: LocalisedStaticPage {
    @Environment(\.decode) var decode
    @Environment(\.articles) var articles
    
    let locale: Locale
    let page: Int
    var title: String {
        "Home".localised(locale: locale, decoder: decode)
    }
    var avaibleArticles: [Article] {
        articles.in(locale: locale)
    }
    var pageCount: Int {
        let reference = Double(avaibleArticles.count) / Double(kPageSize)
        let limit = Int(ceil(reference))
        return limit
    }
    var isFirstPage: Bool { page == 1 }
    var isLastPage: Bool { page == pageCount }
    var pageContent: [Article] {
        let pageIndex = (page - 1) * kPageSize
        let limit = min(page * kPageSize, avaibleArticles.count)
        return avaibleArticles[pageIndex..<limit].map(\.self)
    }
    
    var path: String {
        if page == 1 {
            "/\(locale.identifier)/" + String(describing: Self.self).convertedToSlug()
        } else {
            "/\(locale.identifier)/" + String(describing: Self.self).convertedToSlug() + "/page\(page)"
        }
    }
    
    init(locale: Locale, page: Int = 1) {
        self.locale = locale
        self.page = page
    }

    var body: some HTML {
        ForEach(pageContent) { article in
            Card {
                Text { Link(article) }
            }
        }

        Group {
            Link("Older".localised(locale: locale, decoder: decode), target: Home(locale: locale, page: page + 1).path)
                .linkStyle(.button)

            Link("Newer".localised(locale: locale, decoder: decode), target: Home(locale: locale, page: page - 1).path)
                .linkStyle(.button)
        }
    }
}
