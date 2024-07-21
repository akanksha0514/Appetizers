//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Akanksha Upadhyay on 7/21/24.
//

import Foundation
import SwiftUI

final class ImageLoader: ObservableObject {
  @Published var image: Image? = nil
  
  func loadImage(fromURLString urlString: String) {
    NetworkManager.shared.downloadImages(fromURLString: urlString) { uiimage in
      guard let uiimage = uiimage else { return }
      DispatchQueue.main.async {
        self.image = Image(uiImage: uiimage)
      }
    }
  }
}

struct RemoteImage: View {
  var image: Image?
  
  var body: some View {
    image?.resizable() ?? Image("food-placeholder").resizable()
  }
}

struct AppetizerRemoteImage: View {
  @StateObject var imageLoader = ImageLoader()
  let urlString: String
  var body: some View {
    RemoteImage(image: imageLoader.image)
      .onAppear {
        imageLoader.loadImage(fromURLString: urlString)
      }
  }
}
