//
//  SignUpRouter.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/17/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

protocol SignUpRouterInterface: Dismissable {
  
  func presentMainTabBarModule(with session: UserSessionDemo)
  
}

class SignUpRouter: DefaultRouting {
  
  weak var currentController: UIViewController!
  
  func execute(context: UIViewController) {
    let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
    let controller = storyboard.instantiateInitialViewController() as! SignUpController
    controller.router = self
    currentController = controller
    context.presentViewController(currentController, animated: true, completion: nil)
  }
  
}

extension SignUpRouter: SignUpRouterInterface {
  
  func presentMainTabBarModule(with session: UserSessionDemo) {
    MainTabBarRouter(userSession: session).execute(currentController.view.window!)
  }
  
}