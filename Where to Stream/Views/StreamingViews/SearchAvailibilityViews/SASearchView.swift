//
//  SASearchView.swift
//  Where to Stream
//
//  Created by William Faucett on 2/6/24.
//

import SwiftUI

struct SASearchView: View {
    @State private var titleInput: String = ""
    @ObservedObject var saViewController = SASearchViewController()
    @State var showResults = false
    @State var isLoading = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Where can I watch?")
                        .font(.subheadline)
                    TextField("Enter Title", text: $titleInput)
                }
                Section {
                    Button("Submit") {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        isLoading = true
                        searchStreamingAPI(title: titleInput)
                    }
                    if isLoading {
                        ProgressView().progressViewStyle(CircularProgressViewStyle())
                    }
                }
                .multilineTextAlignment(.center)
                .id(UUID())
                
                Section {
                    Button("Reset") {
                        titleInput = ""
                        saViewController.results = nil
                        showResults = false
                        if isLoading {
                            isLoading = false
                        }
                    }
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                }
            }
            .navigationTitle("Search Programing")
            .sheet(isPresented: $showResults) {
                if saViewController.results != nil {
                    SAResultListView(resultsList: saViewController.results, omdbResult: saViewController.omdbResult, searchText: titleInput)
                        .onAppear {
                            saViewController.findOmdbDetails(title: titleInput)
                        }
                }
            }
        }
        //Using this because the second object is the long poll and always retuns last
        .onReceive(saViewController.$results) { results in
            if results != nil {
                showResults = true
                isLoading = false
            }
        }
    }
    
    func searchStreamingAPI (title: String) {
        DispatchQueue.main.async {
            saViewController.searchByTitle(title: title)
        }
    }
}

#Preview {
    SASearchView()
}
