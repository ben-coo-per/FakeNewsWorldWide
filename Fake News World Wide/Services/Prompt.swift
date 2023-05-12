//
//  Prompt.swift
//  Fake News World Wide
//
//  Created by Ben Cooper on 5/10/23.
//
//  An absolute prompting 🤴KIING 😫


import Foundation

let HeadlinePrompt = "Pretend to be a writer for a satirical news website like The Onion in a world where everything is absurd.\nCreate a valid JSON array of 4 objects for article headlines following this format:\n\n[{\"headline\": \"funny, clever, witty, sarcastic article headline from around the world\",\n\"location\": \"the location that the news story takes place\", \"longitude\": \"the degree of longitude (between 180 and -180) of the location using\", \"latitude\": \"the degree of latitude (between 90 and -90) of the location\",\n\"author\": \"a fitting name for a journalist at that location\"}]\n\nFor example: \n[{\"headline\": \"Subway rats hold strike over new city trash standards\",\n\"location\": \"New York City, USA\", \"longitude\": \"-75.5004\", \"latitude\": \"43.44093\",\n\"author\": \"Cecilia Martin\"}]\n\nThe JSON object:"


