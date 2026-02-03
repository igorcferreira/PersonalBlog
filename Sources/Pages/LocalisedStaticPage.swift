//
//  LocalisedStaticPage.swift
//  IgniteStarter
//
//  Created by Igor Ferreira on 03/02/2026.
//
import Foundation
import Ignite

protocol LocalisedStaticPage: StaticPage {
    var locale: Locale { get }
}

extension LocalisedStaticPage {
    /// Auto-generates a path for this page using its Swift type name.
    var path: String {
        "/\(locale.identifier)/" + String(describing: Self.self).convertedToSlug()
    }
}

