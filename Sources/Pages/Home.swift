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
        ForEach(avaibleArticles) { article in
            Card {
                Text { Link(article) }
            }
        }
    }
}
