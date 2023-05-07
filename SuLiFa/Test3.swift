//
//  Test3.swift
//  RockPaperSc
//
//  Created by Dimash Nsanbaev on 4/13/23.
//

import SwiftUI

struct Test3: View {
    @State var showButton1 = true
    @State var showButton2 = true
    @State var showButton3 = true
    
    var body: some View {
        VStack {
            if showButton1 {
                Button("Button 1") {
                    showButton2 = false
                    showButton3 = false
                }
            }
            
            if showButton2 {
                Button("Button 2") {
                    showButton1 = false
                    showButton3 = false
                }
            }
            
            if showButton3 {
                Button("Button 3") {
                    showButton1 = false
                    showButton2 = false
                }
            }
        }
    }
}


struct Test3_Previews: PreviewProvider {
    static var previews: some View {
        Test3()
    }
}
