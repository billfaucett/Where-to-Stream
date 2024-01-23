//
//  ShowDetailView.swift
//  Where to Stream
//
//  Created by William Faucett on 1/25/24.
//

import SwiftUI
import UIKit

struct ShowDetailView: View {    
    var tvSeriesDetails: TVSeriesDetails?
    @State private var image: UIImage? = nil

    var body: some View {
        Section(header: Text("Program Details")) {
            if tvSeriesDetails != nil {
                List(tvSeriesDetails!.networkNames, id: \.self) {  networkName in
                    Text(networkName)
                }
                if let uiImage = image{
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                } else {
                    Text("Loading image...")
                        .onAppear(perform: loadImage)
                }
                Text(tvSeriesDetails?.plotOverview ?? "None Returned")
                
            } else {
                Text("No Program Details available")
            }
        }
    }
    
    func loadImage(){
        guard let url = URL(string: tvSeriesDetails!.poster) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = uiImage
                }
            }
        }.resume()
    }
}

#Preview {
    ShowDetailView()
}
