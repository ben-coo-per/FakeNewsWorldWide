//
//  HeaderView.swift
//  Fake News World Wide
//
//  Created by Ben Cooper on 5/9/23.
//

import SwiftUI


struct HeaderView: View {
    var body: some View {
        VStack(spacing:0){
            ZStack {
                Color("bg").edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Logo()
                        Spacer()
                        HelpButton()
                    }
                }
                .padding()
            }.frame(maxHeight: 90, alignment: .top)
            Divider().frame(height: 2).overlay(.black)
        }.frame(maxHeight: 90)
    }
}


struct Logo: View{
    var body: some View {
        Image("fnww-logo")
            .resizable().aspectRatio(contentMode: .fit).frame(height: 60)
    }
}

struct HelpButton: View {
    var body: some View {
        ZStack{
            Color(.white)
            Image(systemName:"questionmark.circle.fill").imageScale(.large).padding(10).foregroundColor(.black)
        }.frame(width: 60).overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.black, lineWidth: 1.5)
        )
            
    }
}
