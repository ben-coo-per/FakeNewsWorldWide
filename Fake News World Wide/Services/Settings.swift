//
//  Settings.swift
//  Fake News World Wide
//
//  Created by Ben Cooper on 5/12/23.
//

import SwiftUI

struct Settings: View {
    @AppStorage("apiKey") private var apiKey: String = ""
    @AppStorage("model") private var model: String = baseModel
    var handleFinish: () -> Void

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
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}
