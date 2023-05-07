//
//  Test.swift
//  RockPaperSc
//
//  Created by Dimash Nsanbaev on 4/13/23.
//

import SwiftUI

struct Test: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to my app!")
                Button("Go to next screen") {
                    // Code to execute when the button is tapped
                }
                NavigationLink(destination: NextView()) {
                    Text("Go to next screen")
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct NextView: View {
    var body: some View {
        Text("This is the next screen")
            .navigationTitle("Next Screen")
    }
}


struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
