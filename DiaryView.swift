//
//  DiaryView.swift
//  splashAwards
//
//  Created by CTSS MMS on 4/9/23.
//

import SwiftUI

struct DiaryView: View {
    
    @Binding var diary: Diary
    @State private var isPresented = false
    @State private var moveToAnalysis = false
    @State private var newString = "ejgbiebguoqeh"
    @State private var isEdit = false
    
    var body: some View {
        
        ZStack {
            ScrollView {
                VStack {
                    HStack {
                        
//                        TextField("Enter a title", text: $diary.title)
                        Text(diary.title)
                            .font(.title)
                            .bold()
                        
                        Spacer()
                    }
                    .padding(.bottom, 12)
                    
                    //TextEditor for entry
                    HStack {
                        Text(diary.entry)
                            
                        Spacer()
                    }
                    
                }
                .padding(.horizontal, 20)
            }
            
            //Floating Analyze button
            VStack {
                Spacer()
                
                HStack {
                    Button {
                        fetchData(query: diary.entry)
                        while(emotionList.isEmpty){
                            print("Queueing")
                        }
                        diary.analysis = emotionList
                        diary.isAnalysed = true
                    
                        isPresented = true
                    } label: {
                        Text("Analyze Diary")
                            .padding(20)
                            .foregroundColor(.white)
                            .frame(height: 50)
                            .background(.green)
                            .cornerRadius(12)
                    }
                    
                    Button {
//                        diary.analysis = emotionList
                        print(diary.analysis)
                        print(emotionList)
                        moveToAnalysis = true
                    } label: {
                        Text("Check Analysis")
                            .padding(20)
                            .foregroundColor(.white)
                            .frame(height: 50)
                            .background(.green)
                            .cornerRadius(12)
                    }
                    
                    
                }
                
                NavigationLink(destination: EmotionAnalysisView(diary: $diary), isActive: $moveToAnalysis) {
                    Text("")
                }

            }
            .padding(20)
        }
        .alert(isPresented: $isPresented) {
            Alert(title: Text("Alert"),
                  message: Text("You'll be transferred to see the result of the analysis"),
                  dismissButton: Alert.Button.default(Text("OK"))
            )
        }
        .sheet(isPresented: $isEdit) {
            EditDiaryView(diary: $diary)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isEdit = true
                } label: {
                    Image(systemName: "pencil")
                }

            }
        }
        
           
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView(diary: .constant(Diary(title: "Test", date: "12/12/12", entry: "auehfiehqfuheqoufhoqhc oiuvfhqiufvehqidcybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89", analysis: [])))
    }
}
