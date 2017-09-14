//
//  WikiItem.swift
//  WikiSearch
//
//  Created by Lawrence Herman on 9/13/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import Foundation
import UIKit

class WikiPage {
  
  var pageValues: [String: Any]!
  
  var pageId: Int!
  var pageTitle: String!
  var thumbnail: [String: Any]?
  var source: String!
  var image: UIImage?
  
  // do I really need all this?
  
  init(page: (String, Any)) {
    pageValues = page.1 as? [String: Any]
    pageId = pageValues["pageid"] as? Int
    pageTitle = pageValues["title"] as? String
    
    if let thumbnail = pageValues["thumbnail"] as? [String: Any] {
      source = thumbnail["source"] as? String
      let url = URL(string: source)
      
//      let serialQueue = DispatchQueue(label: "test")
//      serialQueue.async {
      
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
          guard let data = data else { return }
          
          if Thread.isMainThread{
            print("task running in main thread")
          } else {
            print("task running in background thread")
          }
          
          DispatchQueue.main.async {
            self.image = UIImage(data: data)
            print("completed image load")
          }
          
      }
      
      task.resume()

      
    }
    else {
      image = UIImage(named: "Gooroo Logo.png")
    }
  
  
  
  
  }
}


//        DispatchQueue.main.async {
//        }



//  func downloadImage(source: String) {
//    guard let url = URL(string: source) else { return }
//  // is donwloading?
//
//    let session = URLSession.shared
//
//    session.dataTask(with: url) { (data, response, error) in
//
//
//      DispatchQueue.main.async {
//        guard let data = data else { return }
//        let uiImage = UIImage(data: data)
//        self.image = uiImage
//
//      }
//    }
//  }


//extension UIImage {
//
//  func downloadedFrom(url: URL) {
//
//    URLSession.shared.dataTask(with: url) { (data, response, error) in
//      guard
//        let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//        let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//        let data = data, error == nil,
//        let image = UIImage(data: data)
//        else { return }
//      DispatchQueue.main.async() { () -> Void in
//        self = image
//      }
//      }.resume()
//
//
//
//  }
//











//
//
//    session.dataTask(with: request) { (data, response, error) in
//          DispatchQueue.main.async {
//            guard let rawData = data,
//              let image = UIImage(data: rawData)
//              else {completion(nil); return }
//            completion(image)
//          }
//          }
//          .resume()
//      }

