//
//  FeedRouter.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/19/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

protocol FeedRouterInterface {
  
}

class FeedRouter: DefaultRouting {
  
  private(set) weak var currentController: UIViewController!
  private unowned let userSession: UserSessionDemo
  
  init(userSession: UserSessionDemo) {
    self.userSession = userSession
  }
  
  func execute(context: UITabBarController) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewControllerWithIdentifier("FeedController") as! FeedController
    controller.router = self
    currentController = controller
    let navigationWrapper = UINavigationController(rootViewController: currentController)
    context.setViewControllers([navigationWrapper], animated: false)
  }
  
}

extension FeedRouter: FeedRouterInterface {
  
}