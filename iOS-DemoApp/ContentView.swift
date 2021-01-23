//
//  ContentView.swift
//  iOS-DemoApp
//
//  Created by Tenzin Mahabir on 2020-06-10.
//  Copyright © 2020 Tenzin Mahabir. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols = ["apple-1", "star", "cherry"]
    @State private var numbers = [2, 1, 2]
    @State private var backgrounds = [Color.white, Color.white, Color.white]
    
    @State private var credits = 1000
    private var betAmount = 5
    
    //@State private var isHearted = false
    //Make it private so it's only accessible by ContentView
    //@State private var numLikes = 999
    
    var body: some View {
        
        ZStack {
            
            //Background
            Rectangle().foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255)).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Rectangle().foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255)).rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                Spacer()
                
                //Title
                HStack{
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                    
                    Text("SwiftUI Slots").bold().foregroundColor(.white)
                    
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                }.scaleEffect(2)
                
                Spacer()
                
                //Credits counter
                Text("Credits: " + String(credits)).foregroundColor(.black).padding().background(Color.white.opacity(0.5)).cornerRadius(20)
                
                Spacer()
                
                //Cards
                HStack {
                    Spacer()
                    
                    CardView(symbol: $symbols[numbers[0]], background: $backgrounds[0])
                    
                    CardView(symbol: $symbols[numbers[1]], background: $backgrounds[1])
                    
                    CardView(symbol: $symbols[numbers[2]], background: $backgrounds[2])
                    
                    Spacer()
                }
                
                Spacer()
                
                //Button
                Button(action: {
                    
                    //Sets backgrounds back to white
                    //self.backgrounds[0] = Color.white
                    //self.backgrounds[1] = Color.white
                    //self.backgrounds[2] = Color.white
                    
                    //Alternative to the 3 lines above
                    self.backgrounds = self.backgrounds.map { _ in Color.white
                    }
                    
                    //Change the images
                    self.numbers = self.numbers.map { _ in Int.random(in: 0...self.symbols.count-1)
                    }
                    
                    //Check winnings
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                        
                        //Won
                        self.credits += self.betAmount*10
                        
                        //Updates background to green
                        self.backgrounds = self.backgrounds.map { _ in Color.green
                        }
                        
                    } else {
                        self.credits -= self.betAmount
                    }
                    
                }) {
                    Text("Spin").bold().foregroundColor(.white).padding(.all, 10).padding(.horizontal, 30).background(Color.pink).cornerRadius(20)
                }
                
                Spacer()
                
            }
            
            
            
            
        }
        
        //From Demo earlier in tutorial video
        /* ZStack {
         
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
         
         
         } */
        
        //From Demo even earlier in the tutorial video
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
