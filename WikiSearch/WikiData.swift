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
  
  var textCapture = "gooroo"
  
  var pagesArray: [WikiPage] = []
  
  // do i need completion handler?
  
  func getItemsFromAPI(completion: @escaping () -> ()) {
    //  func getItemsFromAPI() {
    
    print(textCapture)
    
    WikiAPIClient.getPages(text: textCapture) { returnJson in
      
      self.pagesArray.removeAll()
      
      var i = 1
      guard let query = returnJson["query"] as? [String: Any] else { return }
      guard let pages = query["pages"] as? [String: Any] else { return }

      for p in pages {
        //        print("in pages loop")
        
        let item = WikiPage(page: p)
        if item.sourceURL != nil {
          self.pagesArray.append(item)
          print("pagescount' \(i)")
        
        }
        
     

        i += 1
      }

      completion()
      
    }
  }
}
