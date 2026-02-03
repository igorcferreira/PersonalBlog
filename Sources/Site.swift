import Foundation
import Ignite
import ArkanaKeys

let kPageSize = 3

@main
struct IgniteWebsite {
    static func main() async {
        var site = ExampleSite()

        do {
            try await site.publish()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ExampleSite: Site {
    @Environment(\.articles) var articles
    var name: String = ArkanaKeys.Global().siteName
    var url = URL(string: ArkanaKeys.Global().hostname)!
    var builtInIconsEnabled = true
    var author = ArkanaKeys.Global().authorName

    var homePage = Index()
    var layout = MainLayout()
    
    var articlePages: [any ArticlePage] {
        Story()
    }
    
    var pageCount: Int {
        let reference = Double(articles.in(locale: .default).count) / Double(kPageSize)
        let limit = Int(ceil(reference))
        return limit
    }
    
    var staticPages: [any StaticPage] {
        var pages: [any StaticPage] = [Locale.default, .alternative].flatMap({ locale in
            (1...pageCount).flatMap({ page in
                [
                    Home(locale: locale, page: page) as any StaticPage,
                ]
            })
        })
        pages.append(contentsOf: [Locale.default, .alternative].flatMap({ locale in
            [
                Categories(locale: locale) as any StaticPage,
            ]
        }))
        return pages
    }
}
