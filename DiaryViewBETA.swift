//
//  DiaryViewBETA.swift
//  splashAwards
//
//  Created by CTSS MMS on 4/9/23.
//

import SwiftUI

struct DiaryViewBETA: View {
    
    @State var diaryObject = Diary(title: "...", date: "aifheiba", entry: "", analysis: [])
    @State private var confirm = false
    @State private var detectSwitch = false
    @State private var isPresented = false


    var body: some View {
        NavigationView {
            VStack{
                
                Text("Dear Diary!")
                    .font(.largeTitle)
                    .bold()
                
                TextField(
                    "How are you feeling?",
                    text: $diaryObject.entry
                )
                .disableAutocorrection(true)
                .textInputAutocapitalization(.never)
                .padding()
                .border(.secondary)
                .padding()
                
                
                Button {
                    confirm = true
                    fetchData(query: String(diaryObject.entry))
                    detectSwitch = true
                    isPresented.toggle()
                } label: {
                    ZStack{
                        Text("Analyze")
                            .italic()
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(.red)
                            .cornerRadius(12)
                    }
                }
                .alert(isPresented: $confirm) {
                    Alert(title: Text("Yes"), message: Text("Thank you for confirming how you're feeling with us! ❤️"), dismissButton: .default(Text("OK THEN")))
    //                Button("OK", role: .cancel){}
                }
        
    
                
            }
        }
    }
}

struct DiaryViewBETA_Previews: PreviewProvider {
    static var previews: some View {
        DiaryViewBETA()
    }
}
