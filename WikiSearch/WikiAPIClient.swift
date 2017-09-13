//
//  WikiAPIClient.swift
//  WikiSearch
//
//  Created by Lawrence Herman on 9/13/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import Foundation
import UIKit

class WikiAPIClient {
  
  // possible alias
  
  class func getPages(with completion: @escaping ([String: Any]) -> ()) {
    
    print("inside wikiClient get pages")
    
    let urlString = "https://en.wikipedia.org/w/api.php?action=query&prop=pageimages&format=json&piprop=thumbnail&pithumbsize=96&pilimit=50&generator=prefixsearch&gpssearch=Cat&gpslimit=50"
    
    let url = URL(string: urlString)!
    
    print(url)
    
    let session = URLSession.shared
    
    // dont need to unwrap url anymore?
    // maybe use urlRequest?
    
    let task = session.dataTask(with: url) { (data, response, error) in
      
                  print("inside dataTask")
                  print("response is \(response)")
      //
      //
                  print("data is \(data)")
                  print(error?.localizedDescription)
      
      guard let data = data else { return }
      
      if let returnJson = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
        
        print("inside json serialization")
        
        if let returnJson = returnJson {
            print("completion returnJson")
          completion(returnJson)
          
        }
      }
    }
    task.resume()
  }

}


//extension WikiAPIClient {
//  
//  func downloadImage(at url: URL, completion: @escaping(UIImage?) -> Void) {
//    
//    let session = URLSession.shared
//    let request = URLRequest(url: url)
//    
//    
//    session.dataTask(with: request) { (data, response, error) in
//      DispatchQueue.main.async {
//        guard let rawData = data,
//              let image = UIImage(data: rawData)
//          else {completion(nil); return }
//          completion(image)
//      }
//    }
//    .resume()
//  }
//}








  
  
  
  
  
  
  
  
  
  
  
  
  
  

