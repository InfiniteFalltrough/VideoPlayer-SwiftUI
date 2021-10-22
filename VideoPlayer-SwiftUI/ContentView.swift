//
//  ContentView.swift
//  VideoPlayer-SwiftUI
//
//  Created by Viktor Golubenkov on 22.10.2021.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    @State private var selectedVideo: VideoModel?
    @State private var videoRate: Float = 0.0
    private let videos = VideoModel.fetchLocalVideos() + VideoModel.fetchRemoteVideos()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    Button (action: {
                        selectedVideo = video
                    }, label: {
                        PreviewLabel(video: video)
                    })
                }
            }.listRowSeparator(.hidden) // since iOS 15
            .navigationTitle("Top videos")
        }.fullScreenCover(item: $selectedVideo) {
            videoRate = 1.0
        } content: { i in
            fullScreenPlayer(video: i)
        }

    }
    
    @ViewBuilder
    private func fullScreenPlayer(video: VideoModel) -> some View {
        if let url = video.videoURL {
            let player = AVPlayer(url: url)
            
            VideoPlayerView(player: player)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    videoRate = 0.0
                    player.play()
                }
        } else {
            VStack {
                Text("Something went wrong!")
            }.frame(width: ScreenSize.width, height: ScreenSize.height, alignment: .center)
                .edgesIgnoringSafeArea(.all)
        }
    }
    
}
