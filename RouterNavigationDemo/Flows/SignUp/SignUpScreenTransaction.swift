//
//  SignUpScreenTransaction.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/19/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

struct SignUpScreenTransaction: Transaction {
  
  private let sourceViewController: UIViewController
  
  init(sourceViewController: UIViewController) {
    self.sourceViewController = sourceViewController
  }
  
  func perform() {
    let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
    let controller = storyboard.instantiateInitialViewController()!
    sourceViewController.presentViewController(controller, animated: true, completion: nil)
  }
  
}