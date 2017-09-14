//
//  WikiPhototsViewControllerCollectionViewController.swift
//  WikiSearch
//
//  Created by Lawrence Herman on 9/13/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import UIKit

//protocol TextCaptureDelegate: class {
//  func textCapture(_ text: String)
//}


class PhotosViewController: UICollectionViewController {
  
  let data = WikiData.sharedInstance
  let reuseIdentifier = "WikiCell"
  var selectedImage = 0
  

  
  @IBOutlet weak var searchField: UITextField!
  
  
  @IBAction func textFieldChanged(_ sender: UITextField) {
 
  print("textField changed")
    data.textCapture = sender.text!
    data.getItemsFromAPI(completion: reload)

  
  
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    data.getItemsFromAPI(completion: reload)
    searchField.becomeFirstResponder()
}
  
  override func viewDidAppear(_ animated: Bool) {
//   reload()
    
  }
//
  func reload() {
    print("reload data called")
    DispatchQueue.main.async {
      self.collectionView?.reloadData()

    }
  }


  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @objc func dismissKeyboard() {
    print("tapped")
    searchField.resignFirstResponder()
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
//
//    let photoDetail = storyboard?.instantiateViewController(withIdentifier: "WikiPhotoDetail") as! WikiPhotoDetail
//
//    photoDetail.image.image = data.pagesArray[indexPath.row].image
//
//    photoDetail.transitioningDelegate = self
//    present(photoDetail, animated: true, completion: nil)
//
  
  
  }


  
}



//Mark: - DataSource
extension PhotosViewController {
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    return data.pagesArray.count
    return data.pagesArray.count
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! WikiPhotoCell
    

//    print("indexpath.row \(indexPath.row)")
//    print("data array count \(data.pagesArray.count)")
    
    
    let image = data.pagesArray[indexPath.row].image
    cell.imageView.image = image
    return cell
  }
  
}

extension PhotosViewController: UIViewControllerTransitioningDelegate {
  
  
  
  
  


}






