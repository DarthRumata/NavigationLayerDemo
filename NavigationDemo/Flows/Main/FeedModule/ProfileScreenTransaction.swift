//
//  ProfileScreenTransaction.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/20/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

struct ProfileScreenTransaction: Transaction {
  
  private let tabBarController: UITabBarController
  private unowned let userSession: UserSessionDemo
  
  init(tabBarController: UITabBarController, userSession: UserSessionDemo) {
    self.tabBarController = tabBarController
    self.userSession = userSession
  }
  
  func perform() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewControllerWithIdentifier("ProfileController") as! ProfileController
    controller.userSession = userSession
    tabBarController.viewControllers!.append(controller)
  }
  
  
}