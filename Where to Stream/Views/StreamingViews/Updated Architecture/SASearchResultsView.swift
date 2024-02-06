//
//  SASearchResults.swift
//  Where to Stream
//
//  Created by William Faucett on 2/6/24.
//

import SwiftUI

struct SASearchResultsView: View {
    @ObservedObject var saViewController : SASearchViewController
    
    var body: some View {
        NavigationView {
            let searchResults = saViewController.results
            SAResultListView(resultsList: searchResults)
        }
    }
}

#Preview {
    SASearchResultsView(saViewController: SASearchViewController())
}
