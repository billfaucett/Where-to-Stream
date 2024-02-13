//
//  SkinnySearchView.swift
//  Where to Stream
//
//  Created by William Faucett on 2/13/24.
//

import SwiftUI

struct SkinnySearchView: View {
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
            }
        }
    }
}

#Preview {
    SkinnySearchView()
}
