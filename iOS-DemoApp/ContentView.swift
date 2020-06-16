//
//  ContentView.swift
//  iOS-DemoApp
//
//  Created by Tenzin Mahabir on 2020-06-10.
//  Copyright © 2020 Tenzin Mahabir. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            
            Image("Breakfast").resizable()
            VStack{
                
        
                ZStack{
                    
                    Image("TopGradient")
                    
                    VStack(){
                            
                            Spacer()
                            HStack(spacing: 165){
                              
                                Text("Hardcore\nAvo Toast").font(.title).fontWeight(.semibold).foregroundColor(Color.white).multilineTextAlignment(.leading)
                                                                                               Image("Heart_health")
                            }
                           Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                           
                    }

                                
                                
                    }
                    

                ZStack{
                    Image("BottomGradient")
                    
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
