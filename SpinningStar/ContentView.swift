//
//  ContentView.swift
//  SpinningStar
//
//  Created by Franka Keil on 2022-04-27.
//

import SwiftUI

struct ContentView: View {
    
    
    // MARK: Stored properties
    
    // 1. Initial state of rotation for the star
    @State var starRotation = 0.0
    
    
    // MARK: Computed properties
    
    var body: some View {
        Image(systemName: "star")
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.yellow)
            .rotation3DEffect(.degrees(starRotation),
                              axis: (x: 0, y: 1, z: 0))
        
            // 2. Trigger the state change with a tap
            .onTapGesture {
                withAnimation(
                    Animation
                        .easeInOut(duration: 2.0)
                ){
                    // 3. Rotate the star twice (change rotation state)
                    starRotation += 360.0 * 2
                }
                
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
