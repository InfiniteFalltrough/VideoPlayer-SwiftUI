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
    
    private let videos = VideoModel.fetchLocalVideos() + VideoModel.fetchRemoteVideos()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { v in
                    Button (action: {
                        selectedVideo = v
                    }, label: {
                        
                    })
                }
            }
        }.navigationTitle("Top videos")
    }
    
    @ViewBuilder
    private func labelPreview(video: VideoModel) -> some View {
        if video.videoURL != nil {
            LazyVStack {
                Text(video.title)
                    .font(.system(.subheadline))
                    .frame(
                        width: ScreenSize.width,
                        height: ScreenSize.height / 16.24,
                        alignment: .leading)
            }.padding(.all)
        }
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
