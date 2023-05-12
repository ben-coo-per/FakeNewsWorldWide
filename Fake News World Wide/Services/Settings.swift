//
//  Settings.swift
//  Fake News World Wide
//
//  Created by Ben Cooper on 5/12/23.
//

import SwiftUI

struct Settings: View {
    var handleFinish: () -> Void
    @AppStorage("apiKey") private var apiKey: String = ""
    @AppStorage("model") private var model: String = baseModel
    
    var body: some View {
        Form {
            Section(header: Text("OpenAI")) {
                TextField("API Key", text: $apiKey)
                TextField("Model", text: $model)
            }
            Button(action: handleFinish) {
                Text("Done")
            }
        }
        .frame(height:300)
        .navigationBarTitleDisplayMode(.inline)
        .scrollContentBackground(.hidden)
    }
}


public class OpenAISettings: ObservableObject {
    @AppStorage("apiKey") private var apiKey: String = ""
    @AppStorage("model") private var model: String = baseModel
}
