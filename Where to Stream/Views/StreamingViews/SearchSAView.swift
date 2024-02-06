//
//  SearchSAView.swift
//  Where to Stream
//
//  Created by William Faucett on 1/26/24.
//

import SwiftUI
import UIKit

struct SearchSAView: View {
    @State private var titleInput: String = ""
    @ObservedObject var saViewController = SASearchViewController()
    @State private var showResults = false
    @State private var isSearching = false
    @State private var image: UIImage? = nil
    
    var body: some View {
        NavigationView{
            Form{
                Section {
                    Text("Where can I watch?")
                        .font(.caption)
                    TextField("Enter Title", text: $titleInput)
                }
                Section {
                    Button("Submit") {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        isSearching = true
                        searchStreamingAPI(title: titleInput)
                        loadImage()
                    }
                }
                
                if isSearching {
                    ProgressView("Searching...")
                        .padding()
                }
                
                if showResults {
                    ShowSADetailView(saViewController: saViewController)
                        .environmentObject(saViewController)
                }
                
                Section {
                    Button("Clear Form") {
                        ClearForm()
                    }
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                }
            }
            .navigationTitle("Search")
        }
        .onReceive(saViewController.$results) { receivedResults in
            showResults = saViewController.results != nil
            saViewController.shouldClearDetails = false
            isSearching = false
        }
    }
    
    func ClearForm () {
        titleInput = ""
        saViewController.results = nil
        saViewController.omdbResults = nil
        saViewController.shouldClearDetails = true
        showResults = false
        image = nil
    }
    
    func searchStreamingAPI (title: String) {
        saViewController.searchByTitle(title: title)
    }
    
    func loadImage(){
        guard let url = URL(string: saViewController.omdbResults?.Poster ?? "No Poster") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = uiImage
                }
            }
        }.resume()
    }
}

#Preview {
    SearchSAView()
}
