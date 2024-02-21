//
//  SAStreamingInfoRow.swift
//  Where to Stream
//
//  Created by William Faucett on 2/21/24.
//

import SwiftUI

struct SAStreamingInfoRow: View {
    let streamingRow: StreamingOption
    var body: some View {
        HStack {
            Text("\(streamingRow.service): \(streamingRow.streamingType)")
        }
    }
}

struct SAStreamingInfoRow_Preview: PreviewProvider {
    static var option = StreamingOption(audios: [], subtitles: [], streamingType: "Subscription", availableSince: 2021, service: "Netflix", link: "")
    
    static var previews: some View {
        SAStreamingInfoRow(streamingRow: option)
    }
}
