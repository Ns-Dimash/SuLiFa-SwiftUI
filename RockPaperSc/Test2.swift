//
//  Test2.swift
//  RockPaperSc
//
//  Created by Dimash Nsanbaev on 4/13/23.
//

import SwiftUI

struct Test2: View {
    @State private var selectedButton: Int? = nil
    
    var body: some View {
        NavigationView{
            
            VStack {
                NavigationLink(destination: DetailView(selectedButton: $selectedButton)) {
                    Text("Open Detail View")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                }
                .padding()
                
                Button("Button 1") {
                    self.selectedButton = 1
                }
                .padding()
                .background(selectedButton == 1 ? Color.blue : Color.gray)
                .foregroundColor(.white)
                
                Button("Button 2") {
                    self.selectedButton = 2
                }
                .padding()
                .background(selectedButton == 2 ? Color.blue : Color.gray)
                .foregroundColor(.white)
                
                Button("Button 3") {
                    self.selectedButton = 3
                }
                .padding()
                .background(selectedButton == 3 ? Color.blue : Color.gray)
                .foregroundColor(.white)
                
                Spacer()
            }
            .padding()

        }
    }
}
struct StrokedCapsuleView: View {
    var body: some View {
        Capsule()
            .stroke(lineWidth: 5)
            .foregroundColor(.purple)
    }
}

struct DetailView: View {
    @Binding var selectedButton: Int?
    
    var body: some View {
        VStack {
            switch selectedButton {
            case 1:
                Text("You selected Button 1")
            case 2:
                Text("You selected Button 2")
            case 3:
                Text("You selected Button 3")
            default:
                Text("Please select a button")
            }
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Detail View")
    }
}



struct Test2_Previews: PreviewProvider {
    static var previews: some View {
        Test2()
    }
}
