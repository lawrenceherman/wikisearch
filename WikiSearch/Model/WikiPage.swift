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
  var sourceURL: String?

  init(page: (String, Any)) {
    pageValues = page.1 as? [String: Any]
    pageId = pageValues["pageid"] as? Int
    pageTitle = pageValues["title"] as? String
    
    if let thumbnail = pageValues["thumbnail"] as? [String: Any] {
      sourceURL = thumbnail["source"] as? String }

  }
}
    
    
