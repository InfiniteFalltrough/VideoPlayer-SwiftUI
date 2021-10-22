//
//  VideoModel.swift
//  VideoPlayer-SwiftUI
//
//  Created by Viktor Golubenkov on 22.10.2021.
//

import Foundation

struct VideoModel: Decodable, Identifiable {
    
    let id = UUID()
    let title: String
    let fileName: String
    let remoteURL: URL?
    
    private enum CodingKeys: String, CodingKey {
        case title
        case fileName = "file_name"
        case remoteURL = "remote_url"
    }
}

