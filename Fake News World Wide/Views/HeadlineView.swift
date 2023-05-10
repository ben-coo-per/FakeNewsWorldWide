//
//  Headline.swift
//  Fake News World Wide
//
//  Created by Ben Cooper on 5/9/23.
//

import Foundation
import SwiftUI


struct HeadlineView: View {
    let headline: String
    let date: Date
    let locationName: String
    let author: String
    
    var body: some View {
        VStack(spacing:16) {
            Divider()
            VStack(spacing:2){
                Text(headline).frame(maxWidth: .infinity, alignment: .leading).font(.custom("PPEditorialNew-Ultrabold", size: 16)).foregroundColor(.black)
                HStack(spacing: 10) {
                    HStack(spacing: 2){
                        Image(systemName: "mappin").renderingMode(.template).resizable().aspectRatio(contentMode: .fit).frame(width: 12, height: 12).foregroundColor(Color("subtleText"))
                        Text(locationName).font(.custom("PPEditorialNew-Ultralight", size: 12)).foregroundColor(Color("subtleText"))
                    }
                    Divider()
                    Text(author).font(.custom("PPEditorialNew-Ultralight", size: 12)).foregroundColor(Color("subtleText"))
                    Divider()
                    Text(date.formatted()).font(.custom("PPEditorialNew-Ultralight", size: 12)).foregroundColor(Color("subtleText"))
                    Spacer()
                }
            }
        }
    }
}
