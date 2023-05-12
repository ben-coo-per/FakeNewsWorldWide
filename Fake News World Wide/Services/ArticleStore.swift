//
//  ArticleStore.swift
//  Fake News World Wide
//
//  Created by Ben Cooper on 5/9/23.
//

import Foundation
import SwiftUI
import Combine



struct StringJSONResponseObj {
    let headline: String
    let author: String
    let location: [String: Any]
}

enum ParsingError: Error {
    case jsonParseError
    case latitudeParseError
    case longitudeParseError
}

extension ParsingError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .jsonParseError:
            return NSLocalizedString(
                "Could not parse the response string into a valid JSON object",
                comment: ""
            )
        case .latitudeParseError:
            return NSLocalizedString(
                "Could not parse the latitude value into a double",
                comment: ""
            )
        case .longitudeParseError:
            return NSLocalizedString(
                "Could not parse the longitude value into a double",
                comment: ""
            )
        }
    }
}

enum APIError {
    case noApiKeyError
}


class ArticleStore: ObservableObject {
    @Published var articles: [Article] = []
    private var cancellables = Set<AnyCancellable>()
    
    let service: ArticleService
    
    @Published var isLoadingHeadlines = false
    
    init(service: ArticleService) {
        self.service = service
    }
    
    func addArticles(_ newArticles: [Article]) {
        articles+=newArticles
    }
    
    func hydrateHeadlines(_ num: Int = 2){
        isLoadingHeadlines = true
        if articles.isEmpty {
            self.service.getHeadlines(3)
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: { completion in
                        switch completion {
                            case .finished:
                                self.isLoadingHeadlines = false
                            case .failure(let error):
                                print("Error: \(error)")
                                self.isLoadingHeadlines = false
                            }
                    },
                    receiveValue: { value in
                        let jsonData = Data(value.choices[0].text.utf8)
                        var articlesToAdd: [Article] = []
                        
                        do {
                            // Believe me, I know how ugly this is...
                            // todo: at a minimum, throw this into a map on the getHeadlines method response
                            guard let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]]
                            else {
                                throw ParsingError.jsonParseError
                            }
                            
                            for a in json {
                                print(a)
                                guard let longitude = (a["longitude"] as? NSString)?.doubleValue
                                else {
                                    throw ParsingError.longitudeParseError
                                }
                                guard let latitude = (a["latitude"] as? NSString)?.doubleValue
                                else {
                                    throw ParsingError.latitudeParseError
                                }
                                
                                
                                articlesToAdd.append(Article(headline: a["headline"] as! String, emoji: a["emoji"] as! String, location: a["location"] as! String, longitude: longitude, latitude: latitude, author: a["author"] as! String, publishedAt: nil, body: nil))
                            }
                            
                            self.addArticles(articlesToAdd)
                        } catch let error as NSError {
                            print("Failed to load: \(error.localizedDescription)")
                        }
                    }
                )
                .store(in: &cancellables)

        }
    }
}


//Just(stubArticles)
//    .receive(on: DispatchQueue.main)
//    .sink(
//        receiveValue: { value in
//            self.addArticles(value)
//        }
//    )
//    .store(in: &cancellables)
