//
//  LoginFlowCoordinator.swift
//  NavigationDemo
//
//  Created by Rumata on 6/27/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

enum LoginFlowEvent {
  case Close, ShowMainFlow
}

class LoginFlowCoordinator: FlowCoordinator {
  
  weak var navigationContext: UIViewController!
  private(set) unowned var appCoordinator: AppNavigationCoordinator
  var flowCompletionHandler: (() -> Void)?
  
  required init(appCoordinator: AppNavigationCoordinator, flowCompletionHandler: (() -> Void)?) {
    self.appCoordinator = appCoordinator
    self.flowCompletionHandler = flowCompletionHandler
  }
  
  func create(input: UserSessionController) -> UIViewController {
    let controller = R.storyboard.login.initialViewController()!
    controller.userSessionController = input
    controller.completionHandler = { event in
      switch event {
      case .Close:
        self.navigationContext.dismissViewControllerAnimated(true, completion: nil)
      case .ShowMainFlow():
        let mainEntryPoint = MainTabBarCoordinator(appCoordinator: self.appCoordinator, flowCompletionHandler: nil).create(input)
        self.appCoordinator.navigationContext.changeRootController(to: mainEntryPoint)
      }
    }

    navigationContext = controller
    
    return navigationContext
  }
  
}