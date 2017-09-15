//
//  WikiPhotoDetail.swift
//  WikiSearch
//
//  Created by Lawrence Herman on 9/14/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import Foundation
import UIKit


class WikiPhotoDetail: UIViewController {
  
  
  @IBOutlet weak var image: UIImageView!
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actionClose(_:))))
  }
  
  @objc func actionClose(_ tap: UITapGestureRecognizer) {
    presentingViewController?.dismiss(animated: true, completion: nil)
  }
  
}
