import Foundation
import Ignite

struct Home: LocalisedStaticPage {
    @Environment(\.decode) var decode
    @Environment(\.articles) var articles
    
    let locale: Locale
    var title: String {
        "Home".localised(locale: locale, decoder: decode)
    }
    var avaibleArticles: [Article] {
        articles.in(locale: locale)
    }

    var body: some HTML {
        ForEach(avaibleArticles) { article in
            Card {
                Text { Link(article) }
            }
        }
    }
}
