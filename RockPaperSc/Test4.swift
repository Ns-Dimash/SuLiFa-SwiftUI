//
//  Test4.swift
//  RockPaperSc
//
//  Created by Dimash Nsanbaev on 4/14/23.
//

import SwiftUI


struct Test4: View {
    
    enum ButtonText: String {
        case button1 = "Button 1"
        case button2 = "Button 2"
        case button3 = "Button 3"
    }
    
    @State var buttonText: ButtonText = .button1
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                buttonText = .button1
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    buttonText = .button2
                }
            }) {
                Text(buttonText.rawValue)
            }
            Button(action: {
                buttonText = .button2
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    buttonText = .button3
                }
            }) {
                Text(buttonText.rawValue)
            }
            Button(action: {
                buttonText = .button3
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    buttonText = .button1
                }
            }) {
                Text(buttonText.rawValue)
            }
        }
    }
}


struct Test4_Previews: PreviewProvider {
    static var previews: some View {
        Test4()
    }
}
