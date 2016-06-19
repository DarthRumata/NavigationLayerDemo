//
//  ProfileRouter.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/18/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

protocol ProfileRouterInterface {
  
  func logout()
  
}

class ProfileRouter: DefaultRouting {
  
  private(set) weak var currentController: UIViewController!
  private unowned let userSession: UserSessionDemo
  
  init(userSession: UserSessionDemo) {
    self.userSession = userSession
  }
  
  func execute(context: UITabBarController) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewControllerWithIdentifier("ProfileController") as! ProfileController
    controller.router = self
    controller.userSession = userSession
    currentController = controller
    let navigationWrapper = UINavigationController(rootViewController: currentController)
    context.viewControllers!.append(navigationWrapper)
  }
  
}

extension ProfileRouter: ProfileRouterInterface {
  
  func logout() {
    userSession.close()
    WelcomeRouter().execute(currentController.view.window!)
  }
  
}