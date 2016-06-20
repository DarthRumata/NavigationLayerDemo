//
//  MainTabBarController.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/17/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
  
  var userSession: UserSessionDemo!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    TransactionsFactory.feedScreenTransaction(self).perform()
    TransactionsFactory.profileScreenTransaction(self, userSession: userSession).perform()
  }
  
}
