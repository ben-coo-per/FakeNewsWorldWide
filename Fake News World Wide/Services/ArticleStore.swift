//
//  ArticleStore.swift
//  Fake News World Wide
//
//  Created by Ben Cooper on 5/9/23.
//

import Foundation
import SwiftUI

class ArticleStore: ObservableObject {
    @Published var articles: [Article] = []
    let service: ArticleService
    
    init(service: ArticleService) {
        self.service = service
    }
    
    func addArticles(_ newArticles: [Article]) {
        articles+=newArticles
    }
    
    func hydrateHeadlines(_ num: Int = 2){
        let headlinesToAdd: [Article] = service.getHeadlines(num)
        self.addArticles(headlinesToAdd)
    }
}
