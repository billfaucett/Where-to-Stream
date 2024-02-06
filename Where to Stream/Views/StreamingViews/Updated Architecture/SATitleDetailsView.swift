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
        NavigationView {
            Section(header: Text("Program Details")) {
                Text(programDetails?.title ?? "title")
                Text(programDetails?.genres.first?.name ?? "genre")
                Text("\(programDetails?.streamingInfo?.us?.first?.capitalizedServiceName ?? "service") - \(programDetails?.streamingInfo?.us?.first?.capitalizedStreamingType ?? "type")")
            }
        }
    }
}

#Preview {
    SATitleDetailsView()
}
