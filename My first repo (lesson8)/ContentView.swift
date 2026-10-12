//
//  ContentView.swift
//  My first repo (lesson8)
//
//  Created by zacharylau on 31/8/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "Tap the button for expert meteorological analysis."
    @State private var isLoading = false

    var body: some View {
        VStack(spacing: 30) {
            Text("The Oracle")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Spacer()
            
            if isLoading {
                ProgressView("Consulting the clouds...")
                    .font(.headline)
            } else {
                Text(message)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
            Spacer()
            
            Button(action: {
                isLoading = true
                message = ""
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    isLoading = false
                    message = "Go look out a window."
                }
            }) {
                Text("Check Weather")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(15)
            }
            .padding(.horizontal, 40)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
