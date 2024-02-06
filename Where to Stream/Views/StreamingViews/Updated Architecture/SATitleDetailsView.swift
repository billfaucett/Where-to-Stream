//
//  SATitleDetailsView.swift
//  Where to Stream
//
//  Created by William Faucett on 2/6/24.
//

import SwiftUI

struct SATitleDetailsView: View {
    //@ObservedObject var saViewController : SASearchViewController
    var programDetails: ProgramDetails?
    @State private var image: UIImage? = nil
    
    var body: some View {
        Section(header: Text("Program Details")) {
            Text(programDetails?.title ?? "title")
            Text(programDetails?.genres.first?.name ?? "genre")
            SAStreamingServiceList(streamers: programDetails?.streamingInfo)
        }
    }
}

#Preview {
    SATitleDetailsView()
}
