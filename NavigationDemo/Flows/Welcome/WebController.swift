//
//  AboutAppController.swift
//  NavigationDemo
//
//  Created by Rumata on 6/29/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import SafariServices

class WebController: UIViewController {
  
  var path: String!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let safariController = SFSafariViewController(
      URL: NSURL(string: path)!,
      entersReaderIfAvailable: true
    )
    safariController.delegate = self
    addChildViewController(safariController)
    view.addSubview(safariController.view)
    safariController.view.frame = view.bounds
    safariController.didMoveToParentViewController(self)
  }
  
}

extension WebController: SFSafariViewControllerDelegate {
  
  func safariViewControllerDidFinish(controller: SFSafariViewController) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
}