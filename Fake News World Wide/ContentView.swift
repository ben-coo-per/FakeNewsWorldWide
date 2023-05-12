//
//  ContentView.swift
//  Fake News World Wide
//
//  Created by Ben Cooper on 5/8/23.
//

import SwiftUI
import Combine


struct ContentView: View {
    @StateObject var articleStore = ArticleStore(service:ArticleService())
    
    var body: some View {
        let locationBinding = Binding.constant( self.articleStore.articles.map { $0.location } )
        
        VStack(spacing:0){
            HeaderView()
            MapView(locations: locationBinding)
            HeadlinesBoxView(){
                ForEach(articleStore.articles, id: \.headline){ article in
                    HeadlineView(headline: article.headline, date: article.date, locationName: article.location.title, author: article.author)
                }
            }
        }.onAppear {
            articleStore.hydrateHeadlines()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
