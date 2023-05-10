//
//  Headlines.swift
//  Fake News World Wide
//
//  Created by Ben Cooper on 5/8/23.
//
//  Gets fake headlines from OpenAI GPT

import Foundation


struct Article {
    let headline: String
    let location: Location
    let date: Date
    let author: String
    let body: String?
    let id: UUID
    
    init(headline: String, location: Location, date: Date, author: String, body: String?) {
        self.headline = headline
        self.location = location
        self.date = date
        self.body = body
        self.author = author
        self.id = UUID()
    }
}
