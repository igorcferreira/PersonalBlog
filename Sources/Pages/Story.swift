//
//  Story.swift
//  IgniteStarter
//
//  Created by Igor Ferreira on 03/02/2026.
//
import Ignite
import Foundation

struct Story: ArticlePage {
    var title: String {
        article.title
    }
    
    var body: some HTML {
        Card {
            Text {
                Link(article)
            }
            .font(.title1)
            
            Text(article.text)
                .font(.body)
        }
        .style(.marginTop, "8pt")
        .style(.marginBottom, "8pt")
    }
}
