//
//  FeedScreenTransaction.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/20/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

struct FeedScreenTransaction: Transaction {
  
  private let tabBarController: UITabBarController
  
  init(tabBarController: UITabBarController) {
    self.tabBarController = tabBarController
  }
  
  func perform() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewControllerWithIdentifier("FeedController") as! FeedController
    tabBarController.setViewControllers([controller], animated: false)
  }
  
  
}