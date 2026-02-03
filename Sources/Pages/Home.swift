import Foundation
import Ignite

struct Home: LocalisedStaticPage {
    @Environment(\.decode) var decode
    
    let locale: Locale
    var title: String {
        "Home".localised(locale: locale, decoder: decode)
    }

    var body: some HTML {
        Text("Hello world!")
            .font(.title1)
    }
}
