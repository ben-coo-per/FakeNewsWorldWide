//
//  ArticleStore.swift
//  Fake News World Wide
//
//  Created by Ben Cooper on 5/9/23.
//

import Foundation
import SwiftUI

let initialArticals = [
    Article(headline: "Gondola traffic jam: chaos in Venice's canals",
            location: Location(title: "Venice, Italy", latitude: 45.4408, longitude: 12.3155),
            date: Date(),
            author: "Kilgore Trout",
            body: nil
           ),
    Article(headline: "Rio's famous Christ the Redeemer statue gets new sunglasses for summer",
            location: Location(title: "Rio de Janeiro, Brazil", latitude: 22.9068, longitude:  43.1729),
            date: Date(),
            author: "Steven Bronie",
            body: nil
           ),
]

class ArticleStore: ObservableObject {
    @Published var articles: [Article] = initialArticals
    
    func addArticle(_ article: Article) {
        articles.append(article)
    }
}
