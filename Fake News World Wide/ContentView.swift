//
//  ContentView.swift
//  Fake News World Wide
//
//  Created by Ben Cooper on 5/8/23.
//

import SwiftUI
import Combine


struct ContentView: View {
    @StateObject var articleStore = ArticleStore()
    
    var body: some View {
        VStack(spacing:0){
            HeaderView()
            MapView(locations: articleStore.articles.map { $0.location })
            HeadlinesBoxView(){
                ForEach(articleStore.articles, id: \.id){ article in
                    HeadlineView(headline: article.headline, date: article.date, locationName: article.location.title, author: article.author)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
