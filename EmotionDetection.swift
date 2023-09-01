//
//  EmotionDetection.swift
//  splashAwards
//
//  Created by CTSS MMS on 16/8/23.
//

import Foundation


struct diary {
    var entry: String
    var result: [Substring]
}

struct emotion: Codable, Identifiable {
    let id = UUID()
    var label: String
    var score: Float
}

struct emotionData: Codable, Identifiable {
    let id = UUID()
    var hasPart: [emotion]
}

class EmotionsGrabber: ObservableObject {
    
    var allEmotions: emotion = emotion(label: "Nil", score: 0.111)
    @Published var dataset: emotionData?
    
    func fetchData(query: String) {
        guard let url = URL(string: "https://api-inference.huggingface.co/models/SamLowe/roberta-base-go_emotions") else {
            return
        }
        
        let headers = ["Authorization": "Bearer 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"]
        let parameters = ["input": query]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
//                print(response)
                let decoder = JSONDecoder()
                DispatchQueue.main.async {
//                    print(data)
                    let jsondata = try! decoder.decode([[emotion]].self, from: data)
                    print(jsondata)
//                    print(self.last)
                }
            }
        }.resume()
    }
}

