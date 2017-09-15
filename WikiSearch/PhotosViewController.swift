//
//  WikiPhototsViewControllerCollectionViewController.swift
//  WikiSearch
//
//  Created by Lawrence Herman on 9/13/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import UIKit
import Kingfisher


//protocol TextCaptureDelegate: class {
//  func textCapture(_ text: String)
//}


class PhotosViewController: UICollectionViewController {
  
  let data = WikiData.sharedInstance
  let reuseIdentifier = "WikiCell"
  let transition = FadeAnimator()
  let selectedImage: UIImageView? = nil
  
  @IBOutlet weak var searchField: UITextField!
  
  @IBAction func textFieldChanged(_ sender: UITextField) {
    
    
    self.data.pagesArray = []
  

    
    print("textField changed")
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
    
//    data.getItemsFromAPI(completion: reload)
    searchField.becomeFirstResponder()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    searchField.becomeFirstResponder()
  }

  func reload() {
    print("reload data called")
    
    DispatchQueue.main.async {
//      self.collectionView?.setNeedsLayout()
//      self.reload()

      self.collectionView?.reloadData()
      
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
//  @objc func dismissKeyboard() {
//    print("tapped")
//    searchField.resignFirstResponder()
//  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let photoDetail = storyboard?.instantiateViewController(withIdentifier: "WikiPhotoDetail") as! WikiPhotoDetail
    
    if let urlString = data.pagesArray[indexPath.row].sourceURL {
      print(urlString)
      if let url = URL(string: "urlString") {
        
//        let image = selectedImage?.kf.setImage(with: url)
        photoDetail.imageView.kf.setImage(with: url)
        
        //        photoDetail.imageView
        
        //        photoDetail.imageView.kf.setImage(with: url)
      }
    }

    photoDetail.transitioningDelegate = self
    present(photoDetail, animated: true, completion: nil)
    
    }
}
  
extension PhotosViewController {
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data.pagesArray.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! WikiPhotoCell
    
    print("indexpath.row \(indexPath.row)")
    print("data array count \(data.pagesArray.count)")
    
    if let urlString = data.pagesArray[indexPath.row].sourceURL {
      let url = URL(string: urlString)
      cell.imageView.kf.setImage(with: url)
    }
    
    return cell
  }
}

extension PhotosViewController: UIViewControllerTransitioningDelegate {
  
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return transition
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    transition.presenting = false
    return transition
  }
}






