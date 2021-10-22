//
//  PreviewLabel.swift
//  VideoPlayer-SwiftUI
//
//  Created by Viktor Golubenkov on 22.10.2021.
//

import SwiftUI

struct PreviewLabel: View {
    
    let video: VideoModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(video.title)
                .fontWeight(.semibold)
            Divider()
                .padding(.bottom, 15)
            
            Image("\(video.fileName)")
                .resizable()
                .scaledToFill()
                .frame(
                    width: ScreenSize.width / 1.25,
                    height: ScreenSize.height / 2.85)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 6,
                        style: .continuous))
        }.padding([.leading, .trailing])
        .frame(
            width: ScreenSize.width / 1.25,
            height: ScreenSize.height / 2.25)
    }
    
}
