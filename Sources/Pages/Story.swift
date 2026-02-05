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
        StoryContent(article: article, linkTitle: false)
    }
}
