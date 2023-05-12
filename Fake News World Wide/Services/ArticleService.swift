//
//  ArticleService.swift
//  Fake News World Wide
//
//  Created by Ben Cooper on 5/10/23.
//
//  Creates headlines and articles using OpenAI Davinci

import Foundation
import OpenAI
import Combine

let stubArticles = [
    Article(headline: "Gondola traffic jam: chaos in Venice's canals",
            location: "Venice, Italy",
            longitude: 12.3155,
            latitude: 45.4408,
            author: "Kilgore Trout",
            publishedAt: Date(),
            body: nil
           ),
    Article(headline: "Rio's famous Christ the Redeemer statue gets new sunglasses for summer",
            location: "Rio de Janeiro, Brazil",
            longitude:  43.1729,
            latitude: 22.9068,
            author: "Steven Bronie",
            publishedAt: Date(),
            body: nil
           ),
]

let headlineQuery = CompletionsQuery(model: baseModel,
                                     prompt: HeadlinePrompt,
                                     temperature: 0.78,
                                     maxTokens: 500,
                                     topP: 1,
                                     frequencyPenalty: 0.13,
                                     presencePenalty:0.51
)

final class ArticleService: ObservableObject{
    let openAI = OpenAI(apiToken: UserDefaults.standard.string(forKey: "apiKey") ?? "")
    
    func getHeadlines(_ num: Int) -> AnyPublisher<CompletionsResult, Error>{
        print("api key: \(UserDefaults.standard.string(forKey: "apiKey") ?? "none")")
        return openAI.completions(query: headlineQuery)
    }
    
    func getArticleBody(article:Article){
        print("called getArticleBody for: \(article.headline)")
    }
    
}
