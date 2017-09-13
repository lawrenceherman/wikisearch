//
//  WikiAPIClient.swift
//  Gooroo WikiSearch
//
//  Created by Lawrence Herman on 9/13/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import Foundation

class WikiAPIClient {
  
  // possible alias
  
  class func getPages(with completion: @escaping ([String: Any]) -> ()) {
    
    print("inside wikiClient get items")
    
    
    
    let urlString = "https://en.wikipedia.org/w/api.php?action=query&prop=pageimages&format=json&piprop=thumbnail&pithumbsize=96&pilimit=50&generator=prefixsearch&gpssearch=Cat&gpslimit=50"
    
    let url = URL(fileURLWithPath: urlString)
    let session = URLSession.shared
    
    // dont need to unwrap url anymore?
    // maybe use urlRequest?
    
    let task = session.dataTask(with: url) { (data, response, error) in
      
      //            print("inside dataTask")
      //            print("response is \(response)")
      //
      //
      //            print("data is \(data)")
      //            print(error?.localizedDescription)
      
      guard let data = data else { return }
      
      if let returnJson = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
        
        print("inside json serialization")
        
        if let returnJson = returnJson {
          
          completion(returnJson)
          
        }
      }
    }
    task.resume()
  }
}











  
  
  
  
  
  
  
  
  
  
  
  
  
  

