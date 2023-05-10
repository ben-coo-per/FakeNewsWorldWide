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
    let id: String
    
    init(headline: String, location: Location, date: Date, author: String, body: String?) {
        self.headline = headline
        self.location = location
        self.date = date
        self.body = body
        self.author = author
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
        
        self.id = "\(kebabCase(headline))-\(dateString)"
    }
}


func kebabCase(_ titleCaseString: String) -> String {
    let lowercaseString = titleCaseString.lowercased()
    let hyphenatedString = lowercaseString.replacingOccurrences(of: " ", with: "-")
    let allowedCharacters = CharacterSet.alphanumerics.union(CharacterSet(charactersIn: "-"))
    let kebabCaseString = hyphenatedString
        .components(separatedBy: allowedCharacters.inverted)
        .joined(separator: "")
    return kebabCaseString
}


