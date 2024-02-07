//
//  SAImageView.swift
//  Where to Stream
//
//  Created by William Faucett on 2/7/24.
//

import SwiftUI

struct SAImageView: View {
    @State private var image: UIImage?
    var urlString : String
    
    var body: some View {
        Group {
            if let uiImage = image {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            } else {
                ProgressView()
            }
        }
        .onAppear {
            ModelHelpers().loadImage(urlString: urlString) { loadedImage in
                self.image = loadedImage
            }
        }
    }
}


#Preview {
    SAImageView(urlString: "https://m.media-amazon.com/images/M/MV5BNWQ1ZmM3MTQtNTVhZC00MWVlLWI5ZjgtYmZiYWQxZjUzZWM0XkEyXkFqcGdeQXVyMzQ2MDI5NjU@._V1_SX300.jpg")
}
