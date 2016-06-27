//
//  MainTabBarRouter.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/17/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

protocol MainTabBarRouterInterface {
  
  func addFeedTab()
  func addProfileTab()
  
}

class MainTabBarRouter: DefaultRouting {
  
  private(set) weak var currentController: UIViewController!
  private let userSession: UserSessionDemo
  
  init(userSession: UserSessionDemo) {
    self.userSession = userSession
  }
  
  func execute(context: UIWindow) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateInitialViewController() as! MainTabBarController
    controller.router = self
    currentController = controller
    context.rootViewController = currentController
  }
  
}

extension MainTabBarRouter: MainTabBarRouterInterface {
  
  func addFeedTab() {
    FeedRouter(userSession: userSession).execute(currentController as! UITabBarController)
  }
  
  func addProfileTab() {
    ProfileRouter(userSession: userSession).execute(currentController as! UITabBarController)
  }
  
}