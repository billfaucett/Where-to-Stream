//
//  VideoPlayerView.swift
//  Where to Stream
//
//  Created by William Faucett on 1/31/24.
//

import AVKit
import SwiftUI

struct VideoPlayerView: UIViewControllerRepresentable {
    let videoURL: URL

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        return playerViewController
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // Update code if needed
    }
}

struct VideoView: View {
    let videoURL = URL(string: "https://www.example.com/your-video-url.mp4")!

    var body: some View {
        VStack {
            VideoPlayerView(videoURL: videoURL)
                .frame(height: 300) // Adjust the height as needed
                .onAppear() {
                    // Optional: Start playing the video automatically
                    // Uncomment the line below if you want the video to start playing when the view appears
                    // AVPlayerViewControllerManager.shared.play()
                }
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
