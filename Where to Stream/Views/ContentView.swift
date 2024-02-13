//
//  ContentView.swift
//  Where to Stream
//
//  Created by William Faucett on 1/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Sandbox App")
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                NavigationLink(destination: SASearchView()){
                    Text("Where can I watch?")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                NavigationLink(destination: SkinnySearchView()){
                    Text("Where can I watch - Skinny?")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                NavigationLink(destination: NHLMainView()){
                    Text("NHL Results & Stats")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
            }
            .navigationTitle("Welcome!")
        }
    }
}

#Preview {
    ContentView()
}
