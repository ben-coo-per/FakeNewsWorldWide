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
    @AppStorage("apiKey") private var apiKey: String = ""
    
    @State var selectedItem = 0
    
    var body: some View {
        let locationBinding = Binding.constant( self.articleStore.articles.map { $0.location } )
        ZStack{
            Color("bg").edgesIgnoringSafeArea(.all)
            TabView(selection: $selectedItem) {
                Settings(handleFinish: {selectedItem = 1}).tag(0)
                
                VStack(spacing:0){
                    HeaderView(goToSettings: {selectedItem = 0})
                    MapView(locations: locationBinding)
                    HeadlinesBoxView(){
                        ForEach(articleStore.articles, id: \.headline){ article in
                            HeadlineView(headline: article.headline, date: article.date, locationName: article.location.title, author: article.author)
                        }
                    }
                }.tag(1)
            }
            .tabViewStyle(.page)
            .onAppear {
                articleStore.hydrateHeadlines()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
