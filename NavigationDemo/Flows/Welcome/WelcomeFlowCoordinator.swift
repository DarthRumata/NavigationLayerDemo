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
  
  private(set) weak var navigationController: UINavigationController?
  private(set) unowned var appCoordinator: ApplicationCoordinator
  var flowCompletionHandler: (() -> Void)?
  
  required init(appCoordinator: ApplicationCoordinator, flowCompletionHandler: (() -> Void)?) {
    self.appCoordinator = appCoordinator
    self.flowCompletionHandler = flowCompletionHandler
  }
  
  func start() {
    let storyboard = UIStoryboard(name: "Welcome", bundle: nil)
    let controller = storyboard.instantiateInitialViewController() as! WelcomeController
    controller.completionHandler = { event in
      switch event {
      case .ShowLogin:
        print("show login")
      case .ShowSignUp:
        print("show sign up")
      }
    }
    appCoordinator.changeRootController(to: controller)
  }
  
}