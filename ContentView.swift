import SwiftUI

struct ContentView: View {
    
    @StateObject var diaryManager = DiaryManager()
    
    var body: some View {
        
        TabView {
            HomeScreen(diaries: diaryManager)
                .tabItem {
                    Label("Diary", systemImage: "book")
                }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
