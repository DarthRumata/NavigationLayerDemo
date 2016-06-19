//
//  LoginRouter.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/17/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

protocol LoginRouterInterface: Dismissable {
  
  func presentMainTabBarModule(with session: UserSessionDemo)
  
}

class LoginRouter: DefaultRouting {
  
  weak var currentController: UIViewController!
  
  func execute(context: UIViewController) {
    let storyboard = UIStoryboard(name: "Login", bundle: nil)
    let controller = storyboard.instantiateInitialViewController() as! LoginController
    controller.router = self
    currentController = controller
    context.presentViewController(currentController, animated: true, completion: nil)
  }
  
}

extension LoginRouter: LoginRouterInterface {
  
  func presentMainTabBarModule(with session: UserSessionDemo) {
    MainTabBarRouter(userSession: session).execute(currentController.view.window!)
  }
  
}