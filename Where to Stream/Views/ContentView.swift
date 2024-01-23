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
                NavigationLink(destination: SearchView()){
                    Text("Search WM API")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                NavigationLink(destination: SearchSAView()){
                    Text("Search SA API")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                NavigationLink(destination: NHLMainView()){
                    Text("NHL Information")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
            }
            .navigationTitle("Hello")
        }
    }
}

#Preview {
    ContentView()
}
