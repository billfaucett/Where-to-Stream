//
//  ShowSADetailView.swift
//  Where to Stream
//
//  Created by William Faucett on 1/27/24.
//

import SwiftUI

struct ShowSADetailView: View {
    @ObservedObject var saViewController : SASearchViewController
    @State private var image: UIImage? = nil
    
    var body: some View {
        Section(header: Text("Program Details")){
            Text(saViewController.results?.result.first?.originalTitle ?? "Something Went Wrong")
            if let uiImage = image{
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            } else {
                Text("Loading image...")
            }
            Text(saViewController.results?.result.first?.streamingInfo?.us?.first?.capitalizedServiceName ?? "Service Name Not Found")
            Text(saViewController.results?.result.first?.streamingInfo?.us?.first?.capitalizedStreamingType ?? "Service Type Not Found")
            Text(saViewController.results?.result.first?.genres.first?.name ?? "")
            Text(saViewController.omdbResult?.Plot ?? "")
        }
        .onReceive(saViewController.$shouldClearDetails) { shouldClear in
            if shouldClear {
                saViewController.results = nil
                saViewController.omdbResult = nil
                saViewController.shouldClearDetails = false
                image = nil
            }
        }
        .onReceive(saViewController.$omdbResult) { result in
            if result != nil {
                loadImage()
            }
        }
    }
        
    
    func loadImage(){
        print(saViewController.omdbResult?.Poster ?? "Empty from SADetail Load Image")
        guard let url = URL(string: saViewController.omdbResult?.Poster.replacingOccurrences(of: "\\/", with: "/") ?? "No Poster") else {
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
    ShowSADetailView(saViewController: SASearchViewController())
}
