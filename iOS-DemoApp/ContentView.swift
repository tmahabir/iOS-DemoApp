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
    @State private var numbers = Array(repeating: 0, count: 9)
    @State private var backgrounds = Array(repeating: Color.white, count: 9)
    
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
                VStack {
                    HStack {
                    Spacer()
                    
                    CardView(symbol: $symbols[numbers[0]], background: $backgrounds[0])
                    
                    CardView(symbol: $symbols[numbers[1]], background: $backgrounds[1])
                    
                    CardView(symbol: $symbols[numbers[2]], background: $backgrounds[2])
                    
                    Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        CardView(symbol: $symbols[numbers[3]], background: $backgrounds[3])
                        
                        CardView(symbol: $symbols[numbers[4]], background: $backgrounds[4])
                        
                        CardView(symbol: $symbols[numbers[5]], background: $backgrounds[5])
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        CardView(symbol: $symbols[numbers[6]], background: $backgrounds[6])
                        
                        CardView(symbol: $symbols[numbers[7]], background: $backgrounds[7])
                        
                        CardView(symbol: $symbols[numbers[8]], background: $backgrounds[8])
                        
                        Spacer()
                    }
                }
                
                Spacer()
                
                HStack (spacing: 20){
                    VStack{
                        //Button
                        Button(action: {
                            
                            //Process a single spin
                            self.processResults()
                            
                        }) {
                            Text("Spin").bold().foregroundColor(.white).padding(.all, 10).padding(.horizontal, 30).background(Color.pink).cornerRadius(20)
                        }
                        Text("\(betAmount)  credits").padding(.top, 10).font(.footnote)
                    }
                    
                    VStack{
                        //Button
                        Button(action: {
                            
                            //Process a max spin
                            self.processResults(true)
                            
                        }) {
                            Text("Max Spin").bold().foregroundColor(.white).padding(.all, 10).padding(.horizontal, 30).background(Color.pink).cornerRadius(20)
                        }
                        Text("\(betAmount*5)  credits").padding(.top, 10).font(.footnote)
                    }
                }
                
                Spacer()
                
            }
            
        }
        
    }
    
    func processResults(_ isMax:Bool = false){
        //Sets backgrounds back to white
        self.backgrounds = self.backgrounds.map { _ in Color.white
        }
        
        if isMax {
            //Spin all the cards
            //Change the images
            self.numbers = self.numbers.map({_ in Int.random(in: 0...self.symbols.count-1) })
            
        } else {
            //Spin the middle row only
            //Change the images
            self.numbers[3] = Int.random(in: 0...self.symbols.count-1)
            self.numbers[4] = Int.random(in: 0...self.symbols.count-1)
            self.numbers[5] = Int.random(in: 0...self.symbols.count-1)
            
        }
        
        //Check winnings
        processWin(isMax)
    }
    
    func processWin(_ isMax:Bool = false){
        
        var matches = 0
        
        if !isMax{
            if isMatch(3,4,5){
                matches += 1
            }
            
        } else {
            //Processing for max spin
            
            // Top Row
            if isMatch(0,1,2){
                matches += 1
            }
            
            //Middle Row
            if isMatch(3,4,5){
                matches += 1
            }
            
            //Bottom Row
            if isMatch(6,7,8){
                matches += 1
            }
            
            //Diagonal top left to bottom right
            if isMatch(0,4,8){
                matches += 1
            }
            
            //Diagonal top right to bottom left
            if isMatch(2,4,6){
                matches += 1
            }
        }
        
        //Check matches and distribute credits
        
        if matches > 0 {
            //At least 1 win
            self.credits += matches*betAmount*2
        } else if !isMax {
            //0 wins, single spin
            self.credits -= betAmount
        } else {
            //0 wins, max spin
            self.credits -= betAmount*5
        }
        
    }
    
    func isMatch(_ index1:Int, _ index2:Int, _ index3:Int) -> Bool {
        
        if self.numbers[index1] == self.numbers[index2] && self.numbers[index2] == self.numbers[index3] {
            
            //Updates background to green
            self.backgrounds[index1] = Color.green
            self.backgrounds[index2] = Color.green
            self.backgrounds[index3] = Color.green
            
            return true
        }
        
        return false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
