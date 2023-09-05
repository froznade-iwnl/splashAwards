import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            HomeScreen()
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
