//
//  WelcomeRouter.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/17/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

protocol WelcomeRouterInterface {
  
  func presentLoginModule()
  func presentSignUpModule()
  
}

class WelcomeRouter: DefaultRouting {
  
  weak var currentController: UIViewController!
  
  func execute(context: UIWindow) {
    let storyboard = UIStoryboard(name: "Welcome", bundle: nil)
    let controller = storyboard.instantiateInitialViewController() as! WelcomeController
    controller.router = self
    currentController = controller
    context.rootViewController = currentController
  }
  
}

extension WelcomeRouter: WelcomeRouterInterface {
  
  func presentLoginModule() {
    LoginRouter().execute(currentController)
  }
  
  func presentSignUpModule() {
    SignUpRouter().execute(currentController)
  }
  
}