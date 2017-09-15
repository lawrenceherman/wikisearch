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
  var textCapture = ""
  var pagesArray: [WikiPage] = []
  
  func getItemsFromAPI(completion: @escaping () -> ()) {
    
    // send text to APIClient to build url String
    WikiAPIClient.getPages(text: textCapture) { returnJson in
      self.pagesArray.removeAll()
      
      guard let query = returnJson["query"] as? [String: Any] else { return }
      guard let pages = query["pages"] as? [String: Any] else { return }
      
      // loop through pages. Instatiating if the have sourceUrl
      for p in pages {
        let item = WikiPage(page: p)
        if item.sourceURL != nil {
          self.pagesArray.append(item)
        }
      }
      
      // after insatiating all Pages reload()
      completion()
    }
  }
}
