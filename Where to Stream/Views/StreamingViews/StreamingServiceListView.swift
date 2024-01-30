//
//  StreamingServiceListView.swift
//  Where to Stream
//
//  Created by William Faucett on 1/26/24.
//

import SwiftUI
import UIKit

struct StreamingServiceListView: View {
    var streamingServices: StreamingSources?

    var body: some View {
        Section(header: Text("TV Series Details")) {
            if let streamingSources = streamingServices?.streamingSources {
                List(streamingSources, id: \.sourceId) { source in
                    Text(source.name)
                }
            } else {
                Text("No TV Series Details available")
            }
        }
    }
}

#Preview {
    StreamingServiceListView()
}
