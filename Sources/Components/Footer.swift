//
//  Footer.swift
//  IgniteStarter
//
//  Created by Igor Ferreira on 03/02/2026.
//
import Foundation
import Ignite

struct Footer: HTML {
    @Environment(\.decode) var decode
    
    let isLastPage: Bool
    let isFirstPage: Bool
    let locale: Locale
    let page: Int
    
    var body: some HTML {
        Section {
            Group {
                if (isLastPage) {
                    Section(content: {})
                } else {
                    Link("Older".localised(locale: locale, decoder: decode), target: Home(locale: locale, page: page + 1).path)
                        .linkStyle(.button)
                }
            }
            
            Group {
                if (isFirstPage) {
                    Section(content: {})
                } else {
                    Link("Newer".localised(locale: locale, decoder: decode), target: Home(locale: locale, page: page - 1).path)
                        .linkStyle(.button)
                }
            }
        }
        .padding()
        .style(.display, "grid")
        .style(.gridTemplateColumns, "1fr 1fr")
        .style(.columnGap, "16pt")
    }
}
