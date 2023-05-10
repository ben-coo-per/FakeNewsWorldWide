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
            location: Location(name: "Venice, Italy", lngLat: (lng: 12.3155, lat: 45.4408)),
            date: Date(),
            author: "Kilgore Trout",
            body: nil
           ),
    Article(headline: "Rio's famous Christ the Redeemer statue gets new sunglasses for summer",
            location: Location(name: "Rio de Janeiro, Brazil", lngLat: (lng:  43.1729, lat:  22.9068)),
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
