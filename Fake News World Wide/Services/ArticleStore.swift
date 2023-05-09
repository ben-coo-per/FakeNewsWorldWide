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
    
    func addArticle(_ article: Article) {
        articles.append(article)
    }
}
