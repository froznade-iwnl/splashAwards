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
    
    var body: some View {
        
        ZStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(diary.title)
                            .font(.title)
                            .bold()
                        
                        Spacer()
                    }
                    .padding(.bottom, 12)
                    
                    HStack {
                        Text(diary.entry)
                        
                        Spacer()
                    }
                    
                }
                .padding(20)
            }
            
            //Floating Analyze button
            VStack {
                Spacer()
                
                Button {
                    fetchData(query: diary.entry)
                    
                    diary.analysis = emotionList
                    diary.isAnalysed = true
                
                    isPresented = true
                } label: {
                    Text("Analyze Diary")
                        .italic()
                        .foregroundColor(.white)
                        .frame(width: 250, height: 50)
                        .background(.green)
                        .cornerRadius(12)
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
                  dismissButton: Alert.Button.default(Text("OK"), action: {
                    moveToAnalysis = true
            })
            )
        }
           
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView(diary: .constant(Diary(title: "Test", date: "12/12/12", entry: "auehfiehqfuheqoufhoqhc oiuvfhqiufvehqidcybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89ybqwiubvdgeqwiufvtiqugfvqgbiuvwgqvbiuqwgnviuybgiqcgiueqgfiuegqfic8e1jkeiuo3hgouhouhjowervewhrubyweoiry89", analysis: [])))
    }
}
