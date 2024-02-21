//
//  SkinnySearchView.swift
//  Where to Stream
//
//  Created by William Faucett on 2/13/24.
//

import SwiftUI

struct SASearchView: View {
    @State private var titleInput: String = ""
    @State private var presentResultView = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Where can I Watch?")
                    TextField("Enter Title", text: $titleInput)
                }
                Section {
                    Button("Search") {
                        presentResultView.toggle()
                    }
                    .sheet(isPresented: $presentResultView) {
                        SAResultListView(searchText: titleInput)
                    }
                }
                Section {
                    Button("Reset") {
                        titleInput = ""
                        presentResultView = false
                    }
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                }
            }
            .navigationTitle("Search Programs")
        }
    }
}

#Preview {
    SASearchView()
}
