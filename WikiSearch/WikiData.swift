//
//  WikiData.swift
//  WikiSearch
//
//  Created by Lawrence Herman on 9/13/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import Foundation


class WikiData {
  
  static let sharedInstance = WikiData()
  
  var pagesArray: [WikiPage] = []
  
  // do i need completion handler?
  
  func getItemsFromAPI(_ completion: @escaping () -> ()) {
    
    WikiAPIClient.getPages { returnJson in
      
      self.pagesArray.removeAll()
      let query = returnJson["query"] as? [String: Any]
      let pages = query?["pages"] as? [String: Any]
      
      // better way to deal with optional?
      
      for p in pages! {
        
        print("in pages loop")
        
         let item = WikiPage(page: p)
        self.pagesArray.append(item)
    
        
     
      }
    }
  }
}
