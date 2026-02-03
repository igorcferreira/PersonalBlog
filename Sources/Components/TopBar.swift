//
//  TopBar.swift
//  IgniteStarter
//
//  Created by Igor Ferreira on 03/02/2026.
//
import Ignite
import Foundation
import ArkanaKeys

struct TopBar: HTML {
    @Environment(\.page) var page
    @Environment(\.decode) var decode
    
    var body: some HTML {
        NavigationBar(logo: nil) {
            Link("Home".localised(locale: page.locale, decoder: decode), target: Home(locale: page.locale))
            Link("GitHub".localised(locale: page.locale, decoder: decode), target: ArkanaKeys.Global().githubPage)
            Link("Mastodon".localised(locale: page.locale, decoder: decode), target: ArkanaKeys.Global().mastodonPage)
            Link("Feed".localised(locale: page.locale, decoder: decode), target: "/feed.rss")
            Spacer()
            Link(page.locale.linkLabel.localised(locale: page.locale, decoder: decode), target: page.path(in: page.locale.linkTarget))
        }
        .navigationItemAlignment(.leading)
    }
}

