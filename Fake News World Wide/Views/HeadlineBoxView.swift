//
//  HeadlineBoxView.swift
//  Fake News World Wide
//
//  Created by Ben Cooper on 5/9/23.
//

import SwiftUI


struct HeadlinesBoxView<Content: View>: View {
    @ViewBuilder var headlines: Content
    @State private var boxHeight: CGFloat = 300
    
    var body: some View {
        VStack(spacing:0){
            Divider().frame(height: 2).overlay(.black)
            ZStack {
                Color("bg").edgesIgnoringSafeArea(.all)
                ScrollView(showsIndicators: true){
                    VStack(spacing:16) {
                        Text("Top Headlines").frame(maxWidth: .infinity, alignment: .leading).font(.custom("PPTelegraf-UltraboldOblique", size: 32))
                        headlines
                    }.padding()
                }
            }.frame(height: boxHeight, alignment: .bottom)
        }.frame(height: boxHeight)
    }
}

