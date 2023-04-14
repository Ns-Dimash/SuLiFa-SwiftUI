//
//  MultiPlayer.swift
//  RockPaperSc
//
//  Created by Dimash Nsanbaev on 4/14/23.
//

import SwiftUI




struct MultiPlayer: View {
    @State var showButton1 = true
    @State var showButton2 = true
    @State var showButton3 = true
    @State var selectedButton: Int?
    @State var otherText = "Take your pick"
    @State var selectedOption = Option.rock
    @State var navigateToNewView = false
    @State var showView = false
    @State var buttonText1: String = "🪨"
    @State var buttonText2: String = "✂️"
    @State var buttonText3: String = "🧻"
    @State var firstPlayer = ""
    @State var secondPlayer = ""
    @State var showScore = true
    @State var showNextButton = false
    
    
    
    
    
    var body: some View{
        VStack {
            Spacer()
            Text(otherText)
                .font(.system(size: 54,weight: .bold))
                .padding(.top,50)
                .multilineTextAlignment(.center)
            if showScore{
                Text("Player 1 • Score 0:0")
                    .foregroundColor(Color(red: 103/255, green: 80/255, blue: 164/255))
            }
            Spacer()
            Spacer()
            VStack(spacing: 24){
                if showButton1 {
                    Button(action: {
                        withAnimation {
                            showButton2 = false
                            showButton3 = false
                            selectedButton = 1
                            otherText = "Your pick"
                            firstPlayer = "🪨"
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                otherText = "Pass the phone to your oponent"
                                showScore = false
                                showNextButton = true
                                showButton1 = false
                                
                                
                            }
                            
                        }
                        
                    }) {
                        VStack{
                            ZStack{
                                Capsule()
                                    .frame(width: 342,height: 128)
                                    .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255,opacity: 1))
                                Text(buttonText1)
                                    .font(.system(size: 80))
                                    .multilineTextAlignment(.center)
                                
                            }
                            
                        }
                        
                        
                    }
                    .padding(selectedButton == 1 ? 100 : 0)
                    
                }
                
                if showButton2 {
                    Button(action: {
                        withAnimation {
                            showButton1 = false
                            showButton3 = false
                            selectedButton = 2
                            otherText = "Your pick"
                            firstPlayer = "✂️"
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                otherText = "Pass the phone to your oponent"
                                showScore = false
                                showNextButton = true
                                showButton2 = false
                                
                                
                            }
                        }
                        
                    }) {
                        
                        ZStack{
                            Capsule()
                                .frame(width: 342,height: 128)
                                .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255,opacity: 1))
                            Text(buttonText2)
                                .font(.system(size: 80))
                                .multilineTextAlignment(.center)
                            
                        }
                    }
                    .padding(selectedButton == 2 ? 100 : 0)
                    
                    
                    
                }
                if showButton3 {
                    
                    Button(action: {
                        withAnimation {
                            showButton2 = false
                            showButton1 = false
                            selectedButton = 3
                            otherText = "Your pick"
                            firstPlayer = "🧻"
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                otherText = "Pass the phone to your oponent"
                                showScore = false
                                showButton3 = false
                                showNextButton = true
                            }
                            
                        }
                        
                    }) {
                        ZStack{
                            Capsule()
                                .frame(width: 342,height: 128)
                                .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255,opacity: 1))
                            Text(buttonText3)
                                .font(.system(size: 80))
                                .multilineTextAlignment(.center)
                            
                        }
                        
                        
                    }
                    .padding(selectedButton == 3 ? 100 : 0)
                    
                }
                Spacer()
                if showNextButton{
                    NavigationLink(destination: SecondPlayer(firstPlayer: $firstPlayer)) {
                        ZStack{
                            Rectangle()
                                .frame(width: 358,height: 50)
                                .cornerRadius(8)
                                .foregroundColor(Color(red: 103/255, green: 80/255, blue: 164/255))
                            Text("Ready to continue")
                                .foregroundColor(.white)
                        }
                    }
                }
                
            }
            .padding(.bottom,80)
            
            
            
            
        }
        .navigationBarTitle("Round #1", displayMode: .inline)
        
        
    }
}

struct SecondPlayer:View{
    @Binding var firstPlayer:String
    @State var showButton1 = true
    @State var showButton2 = true
    @State var showButton3 = true
    @State var selectedButton: Int?
    @State var otherText = "Take your pick"
    @State var navigateToNewView = false
    @State var showView = false
    @State var buttonText1: String = "🪨"
    @State var buttonText2: String = "✂️"
    @State var buttonText3: String = "🧻"
    @State var secondPlayer = ""
    @State var showScore = true
    @State var showNextButton = false
    var body: some View{
        VStack {
            Spacer()
            Text(otherText)
                .font(.system(size: 54,weight: .bold))
                .padding(.top,50)
                .multilineTextAlignment(.center)
            if showScore{
                Text("Player 2 • Score 0:0")
                    .foregroundColor(Color(red: 103/255, green: 80/255, blue: 164/255))
            }
            Spacer()
            Spacer()
            VStack(spacing: 24){
                if showButton1 {
                    Button(action: {
                        withAnimation {
                            showButton2 = false
                            showButton3 = false
                            selectedButton = 1
                            otherText = "Your pick"
                            secondPlayer = "🪨"
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                navigateToNewView = true
                                
                            }
                            
                        }
                        
                    }) {
                        VStack{
                            ZStack{
                                Capsule()
                                    .frame(width: 342,height: 128)
                                    .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255,opacity: 1))
                                Text(buttonText1)
                                    .font(.system(size: 80))
                                    .multilineTextAlignment(.center)
                                
                            }
                            
                        }
                        
                        
                    }
                    .padding(selectedButton == 1 ? 100 : 0)
                    
                }
                
                if showButton2 {
                    Button(action: {
                        withAnimation {
                            showButton1 = false
                            showButton3 = false
                            selectedButton = 2
                            otherText = "Your pick"
                            secondPlayer = "✂️"
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                navigateToNewView = true
                                
                            }                        }
                        
                    }) {
                        
                        ZStack{
                            Capsule()
                                .frame(width: 342,height: 128)
                                .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255,opacity: 1))
                            Text(buttonText2)
                                .font(.system(size: 80))
                                .multilineTextAlignment(.center)
                            
                        }
                    }
                    .padding(selectedButton == 2 ? 100 : 0)
                    
                    
                    
                }
                if showButton3 {
                    
                    Button(action: {
                        withAnimation {
                            showButton2 = false
                            showButton1 = false
                            selectedButton = 3
                            otherText = "Your pick"
                            secondPlayer = "🧻"
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                navigateToNewView = true
                                
                            }
                        }
                        
                    }) {
                        ZStack{
                            Capsule()
                                .frame(width: 342,height: 128)
                                .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255,opacity: 1))
                            Text(buttonText3)
                                .font(.system(size: 80))
                                .multilineTextAlignment(.center)
                            
                        }
                        
                        
                    }
                    .padding(selectedButton == 3 ? 100 : 0)
                    
                }
                NavigationLink(destination: SecondView(buttonText1: $buttonText1, buttonText2: $buttonText2, buttonText3: $buttonText3, firstPlayer: $firstPlayer, secondPlayer: $secondPlayer), isActive: $navigateToNewView) {
                    EmptyView()
                }
            }
            .padding(.bottom,80)
            
            
            
            
        }
        .navigationBarTitle("Round #1", displayMode: .inline)
        
        
    }
}


struct MultiPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MultiPlayer()
    }
}
