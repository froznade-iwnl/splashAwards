import SwiftUI

struct ContentView: View {
    
    @StateObject var emotionManager = EmotionsGrabber()
    @State var diaryObject = diary(entry: "", result: [""])
    @FocusState private var mnm: Bool
    @State private var confirm = false


    var body: some View {
        VStack{
            TextField(
                "User name (email address)",
                text: $diaryObject.entry
            )
            .focused($mnm)
            .onSubmit {
                
            }
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .border(.secondary)
            
            
            Button("Confirm") {
                confirm = true
                diaryObject.result = diaryObject.entry.split(separator: ".")
                for i in 0..<diaryObject.result.count {
                    diaryObject.result[i] = Substring(diaryObject.result[i].trimmingCharacters(in: .whitespaces))
                }
                print(diaryObject.result)
                emotionManager.fetchData(query: String(diaryObject.entry))
            }
            .alert(isPresented: $confirm) {
                Alert(title: Text("Yes"), message: Text("Thank you for confirming how you're feeling with us! ❤️"), dismissButton: .default(Text("OK THEN")))
//                Button("OK", role: .cancel){}
            }
            
            
            Button("check emotions"){
                print(emotionManager.allEmotions)
            }
        }
    }
}
