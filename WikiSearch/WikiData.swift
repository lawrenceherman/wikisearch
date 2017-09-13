//
//  WikiData.swift
//  Gooroo WikiSearch
//
//  Created by Lawrence Herman on 9/13/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import Foundation


class WikiData {
  
  static let sharedInstance = WikiData()
  
  var pages: [WikiPage] = []
  
  
  func getItemsFromAPI(_ completion: @escaping () -> ()) {
    
    WikiAPIClient.getPages { returnJson in
      
      self.pages.removeAll()
      let query = returnJson["query"] as? [String: Any]
      let pages = query?["pages"] as? [String: Any]
      
      // better way to deal with optional?
      
      for page in pages! {
        
    
        
      }
    
    
    
    
    
    
    }
  }
}
