//
//  EmotionDetection.swift
//  splashAwards
//
//  Created by CTSS MMS on 16/8/23.
//

import Foundation


struct Diary: Identifiable {
    let id = UUID()
    var title: String
    var date: String
    var entry: String
    var isAnalysed: Bool = true
    var analysis: [Emotion]
}

struct Emotion: Codable, Identifiable {
    let id = UUID()
    var label: String
    var score: Double
}



// Procedure to fetch data
let apiUrl = URL(string: "https://api-inference.huggingface.co/models/SamLowe/roberta-base-go_emotions")!
let headers = ["Authorization": "Bearer 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"]



func fetchData(query: String) {
    let payload = ["inputs": query]
    var request = URLRequest(url: apiUrl)
    request.httpMethod = "POST"
    request.allHTTPHeaderFields = headers
    request.httpBody = try? JSONSerialization.data(withJSONObject: payload, options: [])
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error: \(error)")
            return
        }
        
        if let data = data {
            do {
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                    print("JSON Response: \(json)")
                    // You can access and process the JSON dat further here
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([[Emotion]].self, from: data)
                   
                    emotionList = result.first!
                    
                    emotionTop = result.first!.first!.label
                    
                } else {
                    print("Invalid JSON format.")
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }
    
    task.resume()
}

var emotionTop: String = "emotions"
var emotionList: [Emotion] = [Emotion(label: "Happy", score: 0.1294385287), Emotion(label: "Cringe", score: 0.035862487561)]
