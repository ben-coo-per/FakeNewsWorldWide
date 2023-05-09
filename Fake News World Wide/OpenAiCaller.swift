//
//  OpenAiCaller.swift
//  Fake News World Wide
//
//  Created by Ben Cooper on 5/8/23.
//

import Foundation
import OpenAI


final class OpenAIClient{
    let openAI = OpenAI(apiToken: ProcessInfo.processInfo.environment["OPEN_AI_KEY"] ?? "")
    
    
}
