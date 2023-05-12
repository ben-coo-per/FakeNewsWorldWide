//
//  HeaderView.swift
//  Fake News World Wide
//
//  Created by Ben Cooper on 5/9/23.
//

import SwiftUI


struct HeaderView: View {
    var goToSettings: ()->Void
    
    var body: some View {
        VStack {
            HStack {
                Button(action: goToSettings){
                    Logo()
                }
                Spacer()
            }
        }
        .padding(.leading, 24)
    }
}


struct Logo: View{
    var body: some View {
        Image("fnww-logo")
            .resizable().aspectRatio(contentMode: .fit).frame(height: 45)
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
