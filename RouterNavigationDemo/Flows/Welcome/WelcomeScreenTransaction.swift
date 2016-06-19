//
//  WelcomeScreenTransaction.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/19/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

struct WelcomeScreenTransaction: Transaction {
  
  private let window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
  }
  
  func perform() {
    let storyboard = UIStoryboard(name: "Welcome", bundle: nil)
    let controller = storyboard.instantiateInitialViewController()
    window.rootViewController = controller
  }
  
}