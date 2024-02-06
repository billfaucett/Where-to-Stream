//
//  SAResultListView.swift
//  Where to Stream
//
//  Created by William Faucett on 2/6/24.
//

import SwiftUI

struct SAResultListView: View {
    var resultsList: ProgramResults?
    
    var body: some View {
        Section (header: Text("Results")) {
            if let resultsList = resultsList?.result {
                List(resultsList.indices, id: \.self) { index in
                    Text("\(resultsList[index].title) - \(resultsList[index].type)")
                }
            }
        }
    }
}

#Preview {
    SAResultListView()
}
