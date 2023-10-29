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
    @State var textEditorHeight : CGFloat = 20
    
    var body: some View {
        Form {
            //Enter Title
            Section("Title") {
                TextField("Enter yout title here: ", text: $diary.title)
                
                
                DatePicker(selection: $diaryDate, in: ...Date.now, displayedComponents: .date) {
                    Text("Select a date")
                }
            }
            
            //Enter What you want to write
            Section("Diary") {
                VStack {
                    
                    TextEditor(text: $diary.entry)
                        .foregroundColor((!diary.entry.isEmpty) ? .black:.gray)
                        .frame(minWidth: 200,
                               idealWidth: 250,
                               maxWidth: 400,
                               minHeight: 300,
                               idealHeight: 325,
                               maxHeight: .infinity,
                               alignment: .center)
                    
                }
            }
            
            
            
            
//            Button("Click me"){
//                print(birthDate.formatted(date: .numeric, time: .omitted))
//            }
            
            Section("") {
                Button {
                    diary.date = diaryDate.formatted(date: .numeric, time: .omitted)
                    presentationMode.wrappedValue.dismiss()
                    diary.isAnalysed = false
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
        EditDiaryView(diary: .constant(Diary(title: "", date: "", entry: "jhihvoehwivhtiqvniqy4tvyewoineqrn9y8vt9y9tn92y49tvwe9wtyw9r8", analysis: [])))
    }
}

struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = value + nextValue()
    }
}
