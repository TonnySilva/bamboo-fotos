//
//  imagesData.swift
//  gitFotos
//
//  Created by erick silva teran on 29/10/2020.
//

import Foundation
import UIKit

     
class ImagesData {
  
  private static var likedImages: [Bool] = [Bool](repeating: false, count: numOfImages())
  private static var imagesTitle: [String] = [String](repeating: "Rellenar Texto", count: numOfImages())
  
  
  static func numOfImages() -> Int {
    //  1 solucion con el guard
    guard let pathUrls: [URL] = imagesUrl() else {return 0 }
    return pathUrls.count
    
    // 2 solucion: usando doble ??
    //        return imagesUrl()?.count ?? 0
    //     3 solucion: usando el if let
    //        if let pathUrls: [URL] = imagesUrl() {
    //          return pathUrls.count
    //        }else {return 0 }
  }
  
  static func imagesUrl() -> [URL]? {
    return Bundle.main.urls(forResourcesWithExtension: "jpg", subdirectory: nil)
  }
  
  static func imageForUrl(_ url: URL) -> UIImage? {
    let imageName: String = url.lastPathComponent
    return UIImage(named: imageName)
    
  }
  
  static func imageForPosition(_ position: Int) -> UIImage? {
    let arrayIndex: Int = position % numOfImages()
    if arrayIndex < numOfImages() {
      if let url: URL = imagesUrl()?[arrayIndex] {
        return imageForUrl(url)
      }
    }
    return nil
  }
  
  
  static func likeImageAtPosition(_ position: Int) {
    let arrayIndex: Int = position % numOfImages()
    if arrayIndex < numOfImages() {
      likedImages[position] = true
    }
  }
  
  static func dislikeImageAtPosition(_ position: Int) {
    let arrayIndex: Int = position % numOfImages()
    if arrayIndex < numOfImages() {
      likedImages[position] = false
    }
  }
  
  static func likeForPosition(_ position: Int) -> Bool {
    let arrayIndex: Int = position % numOfImages()
    if arrayIndex < numOfImages() {
      return likedImages[arrayIndex]
    }
    return false
  }
  
  
  // MARK: - Image description
  static func setTitle(_ title: String, position: Int) {
    imagesTitle[position] = title
    
  }
  
  static func getTitle(_ position: Int) -> String {
    
    return imagesTitle[position]
  }
  
  // MARK: - Private utils
  private static func safeIndex(_ position: Int) -> Int {
    return position % numOfImages()
  }
  
  
  
}

