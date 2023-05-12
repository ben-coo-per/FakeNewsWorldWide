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
    
    @State var settingsOpen: Bool = true
    
    @ViewBuilder
    var body: some View {
        let locationBinding = Binding.constant( self.articleStore.articles.map { $0.location } )
        
        VStack(spacing:0){
            ZStack{
                MapView(locations: locationBinding).ignoresSafeArea(.all)
                VStack{
                    HeaderView(goToSettings: {settingsOpen = true}).frame(alignment: .top)
                    Spacer()
                }.padding(0)
            }
            HeadlinesBoxView(){
                if settingsOpen {
                    Settings(handleFinish: {settingsOpen = false})
                } else if articleStore.isLoadingHeadlines {
                    Spacer()
                    Text("Loading Today's Headlines...")
                        .frame(maxWidth: .infinity)
                        .font(.custom("PPTelegraf-UltraboldOblique",size: 24))
                        .foregroundColor(.black)
                        .onAppear {
                            articleStore.hydrateHeadlines()
                        }
                } else if !articleStore.articles.isEmpty {
                    Text("Top Headlines").frame(maxWidth: .infinity, alignment: .leading).font(.custom("PPTelegraf-UltraboldOblique", size: 32)).foregroundColor(.black)
                    ForEach(articleStore.articles, id: \.headline){ article in
                        HeadlineView(headline: article.headline, emoji: article.emoji, date: article.date, locationName: article.location.title, author: article.author)
                    }
                }
                else {
                    Spacer()
                    Text("Something went wrong").frame(maxWidth: .infinity).font(.custom("PPTelegraf-UltraboldOblique", size: 24)).foregroundColor(.black)
                    Button(action: {articleStore.hydrateHeadlines()}){
                        Text("Refresh")
                    }
                    Text("or").font(.custom("PPTelegraf-UltraboldOblique", size: 16)).foregroundColor(.black)
                    Button(action: {settingsOpen = true}){
                        Text("Check your API settings")
                    }
                }
            }
        }
        .onAppear {
            settingsOpen = apiKey.isEmpty ? true : false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
