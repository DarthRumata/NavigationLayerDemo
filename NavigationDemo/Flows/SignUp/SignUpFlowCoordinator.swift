//
//  SignUpFlowCoordinator.swift
//  NavigationDemo
//
//  Created by Rumata on 6/27/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

class SignUpFlowCoordinator: FlowCoordinator {
  
  weak var navigationContext: UIViewController!
  private(set) unowned var appCoordinator: AppNavigationCoordinator
  var flowCompletionHandler: (() -> Void)?
  
  required init(appCoordinator: AppNavigationCoordinator, flowCompletionHandler: (() -> Void)?) {
    self.appCoordinator = appCoordinator
    self.flowCompletionHandler = flowCompletionHandler
  }
  
  func create(input: UserSessionController) -> UIViewController {
    let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
    let controller = storyboard.instantiateInitialViewController() as! SignUpController
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