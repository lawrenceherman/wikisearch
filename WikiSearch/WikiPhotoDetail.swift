//
//  WikiPhotoDetail.swift
//  WikiSearch
//
//  Created by Lawrence Herman on 9/14/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import Kingfisher

class WikiPhotoDetail: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
  var sourceURl = ""
  var whoosh: AVAudioPlayer!
  
  override func viewDidLoad() {
    loadSound()
    if let url = URL(string: sourceURl) {
      imageView.kf.setImage(with: url)
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // for return tap
    view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actionClose(_:))))
  }
  
  @objc func actionClose(_ tap: UITapGestureRecognizer) {
    whoosh.play()
    presentingViewController?.dismiss(animated: true, completion: nil)
  }
}

extension WikiPhotoDetail{
  
  func loadSound () {
    let path = Bundle.main.path(forResource: "WHOOSH_2", ofType: "mp3")!
    let url = URL(fileURLWithPath: path)
    
    do {
      whoosh = try AVAudioPlayer(contentsOf: url)
      print(whoosh.debugDescription)
    } catch {
      print("sound load error")
    }
  }
}
