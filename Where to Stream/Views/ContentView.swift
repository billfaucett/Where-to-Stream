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
                    Text("Where can I watch a Show?")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                NavigationLink(destination: NHLMainView()){
                    Text("NHL Results & Stats")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Welcome!")
        }
    }
}

#Preview {
    ContentView()
}
