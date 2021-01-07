//
//  ContentView.swift
//  iOS-DemoApp
//
//  Created by Tenzin Mahabir on 2020-06-10.
//  Copyright © 2020 Tenzin Mahabir. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isHearted = false
    //Make it private so it's only accessible by ContentView
    @State private var numLikes = 999
    
    var body: some View {
        
        ZStack {
            
            Image("Breakfast").resizable().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                
                
                ZStack{
                    
                    Image("TopGradient").padding(.bottom, 130.0)
                    
                    
                    VStack(){
                        
                        Spacer()
                        HStack(spacing: 120){
                            
                            Text("Hardcore\nAvo Toast").font(.title).fontWeight(.semibold).foregroundColor(Color.white).multilineTextAlignment(.leading)
                            HStack(spacing: 10){
                                Button(action: {
                                    self.isHearted.toggle()
                                    if isHearted {
                                        numLikes += 1
                                    } else {
                                        numLikes -= 1
                                    }
                                }) {
                                    if isHearted {
                                        Image(systemName: "heart.fill")
                                    } else {
                                        Image(systemName: "heart")
                                    }
                                }.font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                                
                                //Image("Heart_health")
                                
                                Text(String(numLikes))
                                    .font(.largeTitle)
                                    .frame(width: 80.0)
                            }
                        }
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        
                    }
                    
                    
                    
                }
                
                
                ZStack{
                    Image("BottomGradient").padding(.top, 130.0)
                    
                    VStack {
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        Text("Energize with this healthy and hearty breakfast").foregroundColor(.white)
                        
                        Spacer()
                    }
                    
                }
            }
            
            
        }
        
        /* VStack{
         Image("pinkbuilding").resizable().cornerRadius(30).padding().shadow(radius: 10)
         
         Text("This building looks fabulous").fontWeight(.heavy).foregroundColor(.pink).font(.largeTitle).multilineTextAlignment(.center).shadow(color: .blue, radius: 3, x: 2, y: 2)
         //Spacer()
         }*/
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
