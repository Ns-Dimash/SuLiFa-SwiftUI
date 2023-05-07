//
//  ContentView.swift
//  RockPaperSc
//
//  Created by Dimash Nsanbaev on 4/13/23.
//

import SwiftUI

enum Option:String,CaseIterable{
    case rock = "🪨"
    case paper = "🧻"
    case scissors = "✂️"
}


struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("bgf")
                    .resizable()
                    .frame(width: 390,height: 870)
                
                VStack{
                    Text("Welcome to the game!")
                        .foregroundColor(.white)
                        .font(.system(size: 54,weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding(.top,150)
                    Spacer()
                    NavigationLink(destination:ChoisePage(),label: {
                        ZStack{
                            Rectangle()
                                .frame(width: 358,height: 50)
                                .cornerRadius(8)
                                .foregroundColor(Color(red: 103/255, green: 80/255, blue: 164/255))
                            Text("Single player")
                                .foregroundColor(.white)
                        }
                    })
                    
                    NavigationLink(destination:MultiPlayer(),label: {
                        ZStack{
                            Rectangle()
                                .frame(width: 358,height: 50)
                                .cornerRadius(8)
                                .foregroundColor(Color(red: 103/255, green: 80/255, blue: 164/255))
                            Text("Multi player")
                                .foregroundColor(.white)
                        }
                    })
                    .padding(.bottom,70)
                    
                }
            }
            .navigationBarTitle("") // set an empty string to remove the title
            .ignoresSafeArea()
        }
        .accentColor(.black)
        
        
    }
}


struct ChoisePage:View{
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
    
    
    
    
    var body: some View{
        VStack {
            Text(otherText)
                .font(.system(size: 54,weight: .bold))
                .padding(.top,50)
                .multilineTextAlignment(.center)
            Text("Score 0:0")
                .foregroundColor(Color(red: 103/255, green: 80/255, blue: 164/255))
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
                                otherText = "Your opponent is thinking"
                                buttonText1 = "♺"
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    otherText = "Your opponent's pick"
                                    selectedOption = Option.allCases.randomElement() ?? .rock
                                    buttonText1 = selectedOption.rawValue
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        navigateToNewView = true
                                        secondPlayer = buttonText1
                                        
                                    }
                                }
                            }
                        }
                        
                    }) {
                        ZStack{
                            Capsule()
                                .frame(width: 342,height: 128)
                                .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255,opacity: 1))
                            Text(buttonText1)
                                .font(.system(size: 80))
                                .multilineTextAlignment(.center)
                            
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
                                otherText = "Your opponent is thinking"
                                buttonText2 = "♺"
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    otherText = "Your opponent's pick"
                                    selectedOption = Option.allCases.randomElement() ?? .rock
                                    buttonText2 = selectedOption.rawValue
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        navigateToNewView = true
                                        secondPlayer = buttonText2
                                        
                                        
                                    }
                                }
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
                                otherText = "Your opponent is thinking"
                                buttonText3 = "♺"
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    otherText = "Your opponent's pick"
                                    selectedOption = Option.allCases.randomElement() ?? .rock
                                    buttonText3 = selectedOption.rawValue
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        secondPlayer = buttonText3
                                        navigateToNewView = true
                                        
                                    }
                                }
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

struct SecondView: View {
    
    @Binding var buttonText1: String
    @Binding var buttonText2: String
    @Binding var buttonText3: String
    @Binding var firstPlayer:String
    @Binding var secondPlayer:String
    @State var firstScore = 0
    @State var secondScore = 0
    
    var body: some View {
        
        VStack{
            if firstPlayer == secondPlayer{
                Text("Tie!")
                    .font(.system(size: 54,weight: .bold))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .leading, endPoint: .trailing))
                    .padding(.top,50)
                    .multilineTextAlignment(.center)
            }else if firstPlayer == "🪨" && secondPlayer == "✂️" ||
                     firstPlayer == "✂️" && secondPlayer == "🧻" ||
                     firstPlayer == "🧻" && secondPlayer == "🪨"{
                Text("Win!")
                    .font(.system(size: 54,weight: .bold))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.green, .green]), startPoint: .leading, endPoint: .trailing))
                    .padding(.top,50)
                    .multilineTextAlignment(.center)
            }else{
                Text("Lose")
                    .font(.system(size: 54,weight: .bold))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors:[.pink, .red]), startPoint: .leading, endPoint: .trailing))
                    .padding(.top,50)
                    .multilineTextAlignment(.center)
            }
            
            Text("Score \(firstScore):\(secondScore)")
                .foregroundColor(Color(red: 103/255, green: 80/255, blue: 164/255))
            ZStack{
                ZStack{
                    Capsule()
                        .frame(width: 190,height: 128)
                        .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255,opacity: 1))
                    Text(firstPlayer)
                        .font(.system(size: 80))
                        .multilineTextAlignment(.center)
                }
                .padding(.trailing,50)
                ZStack{
                    Capsule()
                        .frame(width: 190,height: 128)
                        .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255,opacity: 1))
                    
                    Text(secondPlayer)
                        .font(.system(size: 80))
                        .multilineTextAlignment(.center)
                    
                }.padding(.top,280)
                    .padding(.leading,50)
                
            }
            Spacer()
            NavigationLink(destination:ChoisePage(),label: {
                ZStack{
                    Rectangle()
                        .frame(width: 358,height: 50)
                        .cornerRadius(8)
                        .foregroundColor(Color(red: 103/255, green: 80/255, blue: 164/255))
                    Text("Another round")
                        .foregroundColor(.white)
                }
            })
            
            
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Result")
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
