//
//  WelcomeFlowCoordinator.swift
//  NavigationDemo
//
//  Created by Rumata on 6/23/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

enum WelcomeFlowEvent {
  case ShowLogin, ShowSignUp
}

class WelcomeFlowCoordinator: FlowCoordinator {
  
  weak var navigationContext: UIViewController!
  private(set) unowned var appCoordinator: AppNavigationCoordinator
  var flowCompletionHandler: (() -> Void)?
  
  required init(appCoordinator: AppNavigationCoordinator, flowCompletionHandler: (() -> Void)?) {
    self.appCoordinator = appCoordinator
    self.flowCompletionHandler = flowCompletionHandler
  }
  
  func create(input: UserSessionController) -> WelcomeController {
    let storyboard = UIStoryboard(name: "Welcome", bundle: nil)
    let controller = storyboard.instantiateInitialViewController() as! WelcomeController
    controller.completionHandler = { event in
      switch event {
      case .ShowLogin:
        let entryPoint = LoginFlowCoordinator(
          appCoordinator: self.appCoordinator,
          flowCompletionHandler: nil
          ).create(input)
        self.navigationContext.presentViewController(entryPoint, animated: true, completion: nil)
      case .ShowSignUp:
        let entryPoint = SignUpFlowCoordinator(
          appCoordinator: self.appCoordinator,
          flowCompletionHandler: nil
          ).create(input)
        self.navigationContext.presentViewController(entryPoint, animated: true, completion: nil)
      }
    }
    navigationContext = controller
    
    return controller
  }
  
}