//
//  EmotionAnalysisView.swift
//  splashAwards
//
//  Created by CTSS MMS on 2/9/23.
//

import SwiftUI

//Main view for the analysis of emotions
struct EmotionAnalysisView: View {
    
    @Binding var diary: Diary
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(diary.analysis) { emotions in
                    EmotionView(emotion: emotions.label, value: emotions.score)
                    
                    Divider()
                }
            }
        }
        .navigationTitle("Emotion Analysis")
    }
}


//Create the View for each of the Emotion Analysed
struct EmotionView: View {
    
    var emotion: String
    var value: Double
    
    var body: some View {
        HStack {
            Text(emotion)
            
            Spacer()
            
            Text("\(value, specifier: "%.3f")")
            
            Divider()
            
        }
        .padding(20)
    }
}

struct EmotionAnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionAnalysisView(diary: .constant(Diary(title: "Test", date: "12/12/12", entry: "auehfiehqfuheqoufhoqhc oiuvfhqiufvehqidcybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89", analysis: [Emotion(label: "Happy", score: 0.1294385287), Emotion(label: "Cringe", score: 0.035862487561)])))
    }
}
