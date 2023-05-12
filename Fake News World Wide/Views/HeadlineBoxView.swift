//
//  HeadlineBoxView.swift
//  Fake News World Wide
//
//  Created by Ben Cooper on 5/9/23.
//

import SwiftUI


struct HeadlinesBoxView<Content: View>: View {
    @ViewBuilder var headlines: Content
    @State var boxHeight: CGFloat = 300
    
    
    var body: some View {
        ZStack {
            Color("bg").edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: true){
                VStack(spacing:16) {
                    headlines
                }.padding()
            }
        }.frame(height: boxHeight, alignment: .bottom)
    }
}
