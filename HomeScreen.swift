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
                    
                    HStack {
                        Text("How are you feeling today?")
                            .font(.title2)
                            .bold()
                        
                        Spacer()
                    }
                    .padding(.horizontal, 17)
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
                                .opacity(0.4)
                            
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
                    
                    if(diaries.Diaries.isEmpty){
                        
                        ZStack {
                            
                            Rectangle()
                                .frame(height: 100)
                                .cornerRadius(12)
                                .padding(.horizontal, 20)
                                .foregroundColor(.gray)
                               
                            
                            VStack {
                                
                                Text("Create your first diary!")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .opacity(0.5)
                                
                            
                            }

                        }
                    } else {
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
                    }
                    
                    Spacer()

                }
                .navigationTitle("Hello!")
                .sheet(isPresented: $sheetShowed) {
                    NewDiaryView(diary: $diaries.Diaries)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Reset") {
                            diaries.Diaries = []
                            
                        }
                    }
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
