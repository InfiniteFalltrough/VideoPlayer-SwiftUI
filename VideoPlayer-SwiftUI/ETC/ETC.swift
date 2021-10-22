//
//  ETC.swift
//  VideoPlayer-SwiftUI
//
//  Created by Viktor Golubenkov on 22.10.2021.
//

import Foundation
import UIKit

struct ScreenSize {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
}

// - Model extension
extension VideoModel {
    var localURL: URL? {
        return Bundle.main.url(forResource: fileName, withExtension: "mp4")
    }
    var videoURL: URL? {
        return remoteURL ?? localURL
    }
    
    static func fetchLocalVideos() -> [VideoModel] {
        return decodeJSON(fileName: "LocalVideos")
    }
    
    static func fetchRemoteVideos() -> [VideoModel] {
        return decodeJSON(fileName: "RemoteVideos")
    }
}

// - Service function
func decodeJSON<T: Decodable>(fileName: String) -> [T] {
  if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
    do {
      let data = try Data(contentsOf: url)
      return try JSONDecoder().decode([T].self, from: data)
    } catch {
      print("Decoding JSON for file: \(fileName) failed!")
      return []
    }
  }
  return []
}
