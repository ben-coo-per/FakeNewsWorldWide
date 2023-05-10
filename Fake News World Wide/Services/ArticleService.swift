//
//  ArticleService.swift
//  Fake News World Wide
//
//  Created by Ben Cooper on 5/10/23.
//
//  Creates headlines and articles using OpenAI Davinci

import Foundation
import OpenAI

let stubArticles = [
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

final class ArticleService: ObservableObject{
    let openAI = OpenAI(apiToken: ProcessInfo.processInfo.environment["OPEN_AI_KEY"] ?? "")
    
    func getHeadlines(_ num: Int) -> [Article]{
        return stubArticles
    }
    
    func getArticleBody(article:Article){
        print("called getArticleBody for: \(article.headline)")
    }
    
}
