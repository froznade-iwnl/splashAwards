//
//  HomeScreen.swift
//  splashAwards
//
//  Created by CTSS MMS on 4/9/23.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var sheetShowed = false
    @ObservedObject var diaries: DiaryManager
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    //Create new Diary

                    Button {
                        sheetShowed = true
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(height: 100)
                                .cornerRadius(12)
                            
                            Text("Write a Diary")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .opacity(0.2)
                            
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                        }
                    }
                    .padding(20)
                    
                    //Previous Diaries
                    HStack {
                        Text("My Diary")
                            .font(.title)
                            .bold()
                         Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                    ForEach($diaries.Diaries) { $diary in
                        NavigationLink {
                            DiaryView(diary: $diary)
                        } label: {

                            VStack {
                                ZStack {
                                    
                                    Rectangle()
                                        .frame(height: 100)
                                        .cornerRadius(12)
                                        .padding(.horizontal, 20)
                                       
                                    
                                    
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(diary.date)
                                                .font(.headline)
                                            
                                            
                                            Spacer()
                                            
                                            Text(diary.title)
                                                .font(.title)
                                        }
                                        .foregroundColor(.white)
                                        .padding(20)
                                        
                                        Spacer()
                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                            .padding(20)
                                        
                                    }
                                    .padding(.horizontal, 20)
                                }

                            }
                        }
                    }
                    
                    Spacer()

                }
                .navigationTitle("Dear Diary!")
                .sheet(isPresented: $sheetShowed) {
                    NewDiaryView(diary: $diaries.Diaries)
                }
            }
        }
    }
}



struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(diaries: DiaryManager())
    }
}
