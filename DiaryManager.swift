//
//  DiaryManager.swift
//  splashAwards
//
//  Created by CTSS MMS on 5/9/23.
//

import Foundation

import Foundation
import SwiftUI

class DiaryManager: ObservableObject {
    @Published var Diaries: [Diary] = [] {
        didSet {
            save()
        }
    }
        
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "Diaries.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedDiaries = try? propertyListEncoder.encode(Diaries)
        try? encodedDiaries?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedDiaryData = try? Data(contentsOf: archiveURL),
            let DiariesDecoded = try? propertyListDecoder.decode([Diary].self, from: retrievedDiaryData) {
            Diaries = DiariesDecoded
        }
    }
}
