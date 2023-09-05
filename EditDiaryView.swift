//
//  EditDiaryView.swift
//  splashAwards
//
//  Created by CTSS MMS on 5/9/23.
//

import SwiftUI

struct EditDiaryView: View {
    @Binding var diary: Diary
    @State private var diaryDate = Date.now
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            //Enter Title
            Section("Info") {
                TextField("Enter yout title here: ", text: $diary.title)
                
                
                DatePicker(selection: $diaryDate, in: ...Date.now, displayedComponents: .date) {
                    Text("Select a date")
                }
            }
            
            //Enter What you want to write
            Section("Diary") {
                TextEditor(text: $diary.entry)
                    .foregroundColor((!diary.entry.isEmpty) ? .black:.gray)
                    
            }
            
            
//            Button("Click me"){
//                print(birthDate.formatted(date: .numeric, time: .omitted))
//            }
            
            Section("Save") {
                Button {
                    diary.date = diaryDate.formatted(date: .numeric, time: .omitted)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    
                    HStack {
                        Spacer()
                        Text("Save Changes")
                        Spacer()
                    }
                    
                }

            }

            
        }
    }
}

struct EditDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        EditDiaryView(diary: .constant(Diary(title: "", date: "", entry: "", analysis: [])))
    }
}
