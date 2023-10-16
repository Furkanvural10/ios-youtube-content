//
//  ContentView.swift
//  IntroductionToSwiftUI
//
//  Created by furkan vural on 16.10.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Text("Hello Welcome to SwiftUI")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.orange)
            
            Text("Second Text")
                .font(.largeTitle)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
