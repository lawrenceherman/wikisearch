//
//  WikiPhototsViewControllerCollectionViewController.swift
//  WikiSearch
//
//  Created by Lawrence Herman on 9/13/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import UIKit
import AVFoundation
import Kingfisher

class PhotosViewController: UICollectionViewController {
  
  let data = WikiData.sharedInstance
  let reuseIdentifier = "WikiCell"
  let transition = FadeAnimator()
  let selectedImage: UIImageView? = nil
  var whoosh: AVAudioPlayer!
  
  @IBOutlet weak var searchField: UITextField!
  
  @IBAction func textFieldChanged(_ sender: UITextField) {
    
    self.data.pagesArray = []
    
    if sender.text! != "" {
      reload()
      data.textCapture = sender.text!
      data.getItemsFromAPI(completion: reload)
    } else  {
      collectionView?.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    searchField.becomeFirstResponder()
    loadSounds()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    searchField.becomeFirstResponder()
  }
  
  func reload() {
    DispatchQueue.main.async {
      self.collectionView?.reloadData()
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // cell tapped
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    whoosh.play()
    
    let photoDetail = storyboard?.instantiateViewController(withIdentifier: "WikiPhotoDetail") as! WikiPhotoDetail
    
    if let urlString = data.pagesArray[indexPath.row].sourceURL {
      print(urlString)
      photoDetail.sourceURl = urlString
    }
    
    photoDetail.transitioningDelegate = self
    present(photoDetail, animated: true, completion: nil)
  }
}

// data sources
extension PhotosViewController {
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data.pagesArray.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! WikiPhotoCell
    
    if let urlString = data.pagesArray[indexPath.row].sourceURL {
      // send url to WikiPhotoDetail for loading
      let url = URL(string: urlString)
      cell.imageView.kf.setImage(with: url)
    }
    return cell
  }
}

// view controller animation functions
extension PhotosViewController: UIViewControllerTransitioningDelegate {
  
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return transition
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    transition.presenting = false
    return transition
  }
}

// the butter
extension PhotosViewController {
  func loadSounds () {
    
    let path = Bundle.main.path(forResource: "WHOOSH_3", ofType: "mp3")!
    let url = URL(fileURLWithPath: path)
    
    do {
      whoosh = try AVAudioPlayer(contentsOf: url)
      print(whoosh.debugDescription)
    } catch {
      print("sound load error")
    }
  }
}






