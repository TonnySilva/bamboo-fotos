//
//  imagesData.swift
//  gitFotos
//
//  Created by erick silva teran on 29/10/2020.
//

import Foundation


  
  
  import UIKit

  class ImagesData {
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
  }
