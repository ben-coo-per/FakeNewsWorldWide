//
//  Headlines.swift
//  Fake News World Wide
//
//  Created by Ben Cooper on 5/8/23.
//
//  Gets fake headlines from OpenAI GPT

import Foundation


struct Article: Decodable {
    let headline: String
    let location: Location
    let author: String
    let publishedAt: Date?
    let body: String?
    let date: Date
    
    init(headline: String, location: String, longitude: Double, latitude: Double, author: String, publishedAt: Date?, body: String?) {
        self.headline = headline
        self.location = Location(title: location, longitude: longitude, latitude: latitude)
        self.author = author
        self.publishedAt = publishedAt
        self.body = body
        self.date = Date()
    
    }
}
