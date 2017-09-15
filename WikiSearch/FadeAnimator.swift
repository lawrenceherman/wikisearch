//
//  FadeAnimator.swift
//  WikiSearch
//
//  Created by Lawrence Herman on 9/14/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import UIKit

class FadeAnimator: NSObject, UIViewControllerAnimatedTransitioning {

  let duration = 1.0
  var presenting = true
  var originFrame = CGRect.zero
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return duration
  }

  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
      let containerView = transitionContext.containerView
    let toView = transitionContext.view(forKey: .to)!
    
    containerView.addSubview(toView)
    toView.alpha = 0.0
    UIView.animate(withDuration: duration, animations: {
      toView.alpha = 1.0
    }) { _ in
      transitionContext.completeTransition(true)
    }
  }
}
