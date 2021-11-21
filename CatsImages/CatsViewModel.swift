//
//  CatsViewModel.swift
//  CatsImages
//
//  Created by Дэлина Дворжецкая on 18.11.2021.
//

import Foundation
import SwiftUI

class CatsViewModel: ObservableObject {
//    @Published static var allImages: [String] = ["cat0", "cat1", "cat2", "cat3", "cat4", "cat5", "cat6"]
    static var allImages: [String] = ["cat0", "cat1", "cat2", "cat3", "cat4", "cat5", "cat6"]
    
    static var images: [CatsImagesModel] = []
    
    static func getImages() -> [CatsImagesModel] {
        for index in 0...allImages.count - 1 {
            self.images.append(CatsImagesModel(id: "cat\(index)"))
        }
        print(images)
        return images
    }
    
    static var catsImages: [CatsImagesModel] {
        self.getImages()
    }
    
    
}
