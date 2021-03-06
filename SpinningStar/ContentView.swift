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
    
    // 1. Initial opacity fo unfilled star
    @State var unfilledStarOpacity = 1.0
    
    // 1. Initial opacity fo filled star
    @State var filledStarOpacity = 0.0
    
    
    // MARK: Computed properties
    
    var body: some View {
        
        
        ZStack{
            
            // Filled star
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.yellow)
                .rotation3DEffect(.degrees(starRotation),
                                  axis: (x: 0, y: 1, z: 0))
                .opacity(filledStarOpacity)
            
                // 2. Trigger the state change with a tap
                .onTapGesture {
                    withAnimation(
                        Animation
                            .easeInOut(duration: 2.0)
                    ){
                        // 3. Rotate the star twice (change rotation state)
                        starRotation += 360.0 * 2
                        
                        // 3. Desired end opacity for unfilled star
                        unfilledStarOpacity = 1.0
                        
                        // 3. Desired end opacity for filled star
                        filledStarOpacity = 0.0
                    
                    }
                }
            
            
            
            
            // Unfilled star
            Image(systemName: "star")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.yellow)
                .rotation3DEffect(.degrees(starRotation),
                                  axis: (x: 0, y: 1, z: 0))
                .opacity(unfilledStarOpacity)

            // 2. Trigger the state change with a tap
                .onTapGesture {
                    withAnimation(
                        Animation
                            .easeInOut(duration: 2.0)
                    ){
                        // 3. Rotate the star twice (change rotation state)
                        starRotation += 360.0 * 2

                        // 3. Desired end opacity for unfilled star
                        unfilledStarOpacity = 0.0
                        
                        // 3. Desired end opacity for filled star
                        filledStarOpacity = 1.0
                    }

                }
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
