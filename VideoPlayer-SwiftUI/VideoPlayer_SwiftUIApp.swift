//
//  VideoPlayer_SwiftUIApp.swift
//  VideoPlayer-SwiftUI
//
//  Created by Viktor Golubenkov on 22.10.2021.
//

import SwiftUI
import AVFoundation

@main
struct VideoPlayer_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    try? AVAudioSession.sharedInstance().setCategory(.playback)
                }
        }
    }
}
