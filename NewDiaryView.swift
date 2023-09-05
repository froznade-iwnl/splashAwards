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
                    
            }
            
            
//            Button("Click me"){
//                print(birthDate.formatted(date: .numeric, time: .omitted))
//            }
            
            Section("Save") {
                Button {
                    diary.insert(Diary(title: title, date: date.formatted(date: .numeric, time: .omitted), entry: entry, analysis: []), at: 0)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Click me")
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
