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
  case Close, ShowMainFlow(session: UserSessionDemo)
}

class LoginFlowCoordinator: FlowCoordinator {
  
  weak var navigationContext: UINavigationController!
  private(set) unowned var appCoordinator: AppNavigationCoordinator
  var flowCompletionHandler: (() -> Void)?
  
  required init(appCoordinator: AppNavigationCoordinator, flowCompletionHandler: (() -> Void)?) {
    self.appCoordinator = appCoordinator
    self.flowCompletionHandler = flowCompletionHandler
  }
  
  func create() -> UINavigationController {
    let storyboard = UIStoryboard(name: "Login", bundle: nil)
    let controller = storyboard.instantiateInitialViewController() as! LoginController
    controller.completionHandler = { event in
      switch event {
      case .Close:
        self.route(with: .Dismiss, animated: true)
      case .ShowMainFlow(let session):
        print("show sign up")
      }
    }

    navigationContext = UINavigationController(rootViewController: controller)
    
    return navigationContext
  }
  
}