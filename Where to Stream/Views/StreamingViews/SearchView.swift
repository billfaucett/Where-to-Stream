//
//  SearchView.swift
//  Where to Stream
//
//  Created by William Faucett on 1/23/24.
//

import SwiftUI

struct SearchView: View {
    @State private var titleInput: String = ""
    @ObservedObject var watchViewController = WMSearchViewControler()
    @State private var showResults = false
    @State private var isSearching = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Where can I watch?")
                    TextField("Enter Title", text: $titleInput)
                }

                Section {
                    Button("Submit") {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        searchStreamingAPI(title: titleInput)
                        isSearching = true
                    }
                }

                if showResults {
                    ResultsSectionView(results: watchViewController.results)
                    ShowDetailView(tvSeriesDetails: watchViewController.tvSeriesDetails)
                    StreamingServiceListView(streamingServices: watchViewController.streamingSourceDetails)
                }
                
                Section {
                    Button("Clear") {
                        clearForm()
                    }
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                }
            }
            .navigationTitle("Search")
        }
        .onReceive(watchViewController.$results) { receivedResults in
            // This closure is executed when the results property in watchViewController is updated.
            // You can check the conditions here and update showResults accordingly.
            showResults = watchViewController.results != nil && !watchViewController.results!.title_results.isEmpty
            isSearching = false
        }
        .onReceive(watchViewController.$tvSeriesDetails) { _ in
                    // This closure is executed when the tvSeriesDetails property in watchViewController is updated.
                    // You can perform actions based on the updated tvSeriesDetails.
        }
        .onReceive(watchViewController.$streamingSourceDetails) { _ in
                    // This closure is executed when the tvSeriesDetails property in watchViewController is updated.
                    // You can perform actions based on the updated tvSeriesDetails.
        }
    }

    func searchStreamingAPI(title: String) {
        if title != "" {
            watchViewController.searchByTitle(title: title)
        }
    }
    
    func clearForm() {
        titleInput = ""
        showResults = false
        isSearching = false
        watchViewController.results = nil
        watchViewController.tvSeriesDetails = nil
        watchViewController.streamingSourceDetails = nil
    }
}

struct ResultsSectionView: View {
    let results: WatchSearchResult?

    var body: some View {
        Section (header: Text("You watch this show: ")){
            ScrollView {
                Text(results?.title_results.first?.name ?? "None")
                Text("On the Service(s) below:")
            }
        }
    }
}

struct DetailsSectionView: View {
    var tvSeriesDetails: TVSeriesDetails?

    var body: some View {
        Section(header: Text("TV Series Details")) {
            if tvSeriesDetails != nil {
                Text(tvSeriesDetails?.networkNames.first ?? "default")
                //Text(tvSeriesDetails?.s)
                Text(tvSeriesDetails?.plotOverview ?? "None Returned")
                // Add more properties as needed
            } else {
                Text("No TV Series Details available")
            }
        }
    }
}

struct ResultsSectionErrorView: View {
    //let results: WatchSearchResult?

    var body: some View {
        Section (header: Text("Error finding Show")){
            ScrollView {
                Text("Error returning the show you selected...")
                Text("Please clear the form and try another Title.")
            }
        }
    }
}


#Preview {
    SearchView()
}
