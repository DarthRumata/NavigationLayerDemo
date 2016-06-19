//
//  MainTabBarScreenTransaction.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/19/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

struct MainTabBarScreenTransaction: Transaction {
  
  private let window: UIWindow
  private let userSession: UserSessionDemo
  
  init(window: UIWindow, userSession: UserSessionDemo) {
    self.window = window
    self.userSession = userSession
  }
  
  func perform() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateInitialViewController() as! MainTabBarController
    controller.userSession = userSession
    window.rootViewController = controller
  }
  
  
}