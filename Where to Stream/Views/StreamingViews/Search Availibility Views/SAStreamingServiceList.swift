//
//  SAStreaminServiceList.swift
//  Where to Stream
//
//  Created by William Faucett on 2/6/24.
//

import SwiftUI

struct SAStreamingServiceList: View {
    var streamers: StreamingInfo?
    
    var body: some View {
        Section(header: Text("Services")) {
            if let options = streamers?.us {
                List(options.indices, id: \.self) { index in
                    Text("\(options[index].capitalizedServiceName) \(options[index].capitalizedStreamingType)")
                }
            }
        }
    }
}

#Preview {
    SAStreamingServiceList()
}
