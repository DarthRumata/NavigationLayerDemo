//
//  MainTabBarCoordinator.swift
//  NavigationDemo
//
//  Created by Rumata on 6/27/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

enum MainTabBarFlowEvent {
  case Logout
}

class MainTabBarCoordinator: FlowCoordinator {
  
  private(set) weak var navigationContext: UITabBarController!
  var flowCompletionHandler: FlowCompletionHandler?
  
  required init(flowCompletionHandler: FlowCompletionHandler?) {
    self.flowCompletionHandler = flowCompletionHandler
  }
  
  func create(input: UserSessionController) -> UITabBarController {
    let storyboard = R.storyboard.main
    let tabController = storyboard.initialViewController()!
    
    let feedController = storyboard.feedController()!
    let profileController = storyboard.profileController()!
    profileController.userSession = input.currentSession!
    profileController.completionHandler = { event in
      switch event {
      case .Logout:
        input.currentSession!.close()
        self.flowCompletionHandler?(.PresentWelcomeFlow)
      }
    }
    tabController.setViewControllers([feedController, profileController], animated: false)
    
    navigationContext = tabController
    
    return navigationContext
  }
  
}