//
//  NewDiaryView.swift
//  splashAwards
//
//  Created by CTSS MMS on 4/9/23.
//

import SwiftUI

struct NewDiaryView: View {
    
    @State private var entry: String = "How are you feeling today?"
    @State private var title: String = ""
    @State private var isTouched = false
    @State private var date = Date.now
    @State var diaryAnalysis: [Emotion] = []
    @Binding var diary: [Diary]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            //Enter Title
            Section("Info") {
                TextField("Enter yout title here: ", text: $title)
                
                
                DatePicker(selection: $date, in: ...Date.now, displayedComponents: .date) {
                    Text("Select a date")
                }
            }
            
            //Enter What you want to write
            Section("Diary") {
                TextEditor(text: $entry)
                    .foregroundColor((isTouched) ? .black:.gray)
                    .onTapGesture {
                        if(!isTouched){
                            entry = ""
                            isTouched = true
                        }
                    }
                    .frame(minWidth: 200,
                           idealWidth: 250,
                           maxWidth: 400,
                           minHeight: 300,
                           idealHeight: 325,
                           maxHeight: .infinity,
                           alignment: .center)
                    
            }
            
            
//            Button("Click me"){
//                print(birthDate.formatted(date: .numeric, time: .omitted))
//            }
            
            Section("") {
                Button {
                    
                    fetchData(query: entry)
                    while(emotionList.isEmpty){
                        print("Queueing")
                    }
                    diaryAnalysis = emotionList
                    
                    
                    diary.insert(Diary(title: title, date: date.formatted(date: .numeric, time: .omitted), entry: entry, isAnalysed: true, analysis: diaryAnalysis), at: 0)
                    
                    emotionList = []
                    
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    HStack {
                        Spacer()
                        Text("Save Diary")
                        Spacer()
                    }
                }

            }

            
        }
    }
}

struct NewDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        NewDiaryView(diary: .constant([]))
    }
}
