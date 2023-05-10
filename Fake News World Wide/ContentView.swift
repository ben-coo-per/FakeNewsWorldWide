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
    
    func addArticle() {
        print("called add article")
        let l = Location(name: "here", lngLat: (lng: 2.3, lat:4.5))
        let a = Article(headline: "foo",
                        location: l,
                        date: Date(),
                        author:"Boo Baby",
                        body: nil
        )
        articleStore.addArticle(a)
    }
    
    

    var body: some View {
        VStack(spacing:0){
            HeaderView()
            MapView()
            HeadlinesBoxView(){
                ForEach(articleStore.articles, id: \.id){ article in
                    HeadlineView(headline: article.headline, date: article.date, locationName: article.location.name, author: article.author)
                    HeadlineView(headline: article.headline, date: article.date, locationName: article.location.name, author: article.author)
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
