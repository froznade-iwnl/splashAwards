//
//  playground.swift
//  splashAwards
//
//  Created by CTSS MMS on 16/9/23.
//

import Foundation
import NaturalLanguage

func isPositiveEmotion(_ emotion: String) -> Bool {
    let tagger = NLTagger(tagSchemes: [.sentimentScore])
    tagger.string = emotion
    
    let sentiment = tagger.tag(at: emotion.startIndex, unit: .paragraph, scheme: .sentimentScore).0?.rawValue
    
    if let sentimentScore = Double(sentiment ?? "0") {
        return sentimentScore > 0
    } else {
        return false
    }
}
