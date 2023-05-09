//
//  HeadlineBoxView.swift
//  Fake News World Wide
//
//  Created by Ben Cooper on 5/9/23.
//

import SwiftUI


struct HeadlinesBoxView<Content: View>: View {
    @ViewBuilder var content: Content
    @State private var boxHeight: CGFloat = 200
    
    var body: some View {
        VStack(spacing:0){
            Divider().frame(height: 2).overlay(.black)
            ZStack {
                Color("bg").edgesIgnoringSafeArea(.all)
                VStack {
                    content
                }
                .padding()
            }.frame(height: boxHeight, alignment: .bottom)
        }.frame(height: boxHeight)
    }
}

