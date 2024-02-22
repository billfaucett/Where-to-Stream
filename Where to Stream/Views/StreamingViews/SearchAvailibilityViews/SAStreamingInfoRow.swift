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
        ScrollView{
            HStack {
                Text("\(streamingRow.service.capitalized): \(streamingRow.streamingType.capitalized)")
                    .font(.subheadline)
                if let link = URL(string: streamingRow.link!) {
                    Button(action: {
                        UIApplication.shared.open(link)
                    }) {
                        Text("Watch")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .font(.caption)
                    }
                } else {
                    Text("")
                }
            }
        }
    }
}

struct SAStreamingInfoRow_Preview: PreviewProvider {
    static var option = StreamingOption(audios: [], subtitles: [], streamingType: "Subscription", availableSince: 2021, service: "Netflix", link: "https://www.netflix.com/title/70153373/")
    
    static var previews: some View {
        SAStreamingInfoRow(streamingRow: option)
    }
}
