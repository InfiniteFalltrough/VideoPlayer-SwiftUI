//
//  ContentView.swift
//  VideoPlayer-SwiftUI
//
//  Created by Viktor Golubenkov on 22.10.2021.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selectedVideo: VideoModel?
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
            }.onAppear {
                UITableView.appearance().separatorColor = .clear // .listRowSeparator(.hidden) - available since iOS 15
            }
            .navigationTitle("Top videos")
        }.fullScreenCover(item: $selectedVideo) {
        } content: { i in
            fullScreenPlayer(video: i)
        }

    }
    
    @ViewBuilder
    private func fullScreenPlayer(video: VideoModel) -> some View {
        if let url = video.videoURL {
            let player = AVPlayer(url: url)
            
            VideoPlayer(player: player)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    player.play()
                }
        } else {
            VStack {
                Text("Something went wrong!")
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Back")
                        .fontWeight(.semibold)
                })

            }.frame(width: ScreenSize.width, height: ScreenSize.height, alignment: .center)
                .edgesIgnoringSafeArea(.all)
        }
    }
    
}
