//
//  DetailsWrapperView.swift
//  Where to Stream
//
//  Created by William Faucett on 2/7/24.
//

import SwiftUI

struct DetailsWrapperView: View {
    var programDetails: ProgramDetails?
    @State var omdbDetails: OMdbModelResult?
    @State var updatedOmdb: OMdbModelResult?
    
    var body: some View {
        SATitleDetailsView(programDetails: programDetails)
    }
    
    func getOmdbDetail (title: String) {
        let controller = SASearchViewController()
        controller.getOmdbDetails(title: title)
        self.updatedOmdb = controller.omdbResult
    }
}

#Preview {
    DetailsWrapperView()
}
