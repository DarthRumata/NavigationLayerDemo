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
  private(set) unowned var appCoordinator: AppNavigationCoordinator
  var flowCompletionHandler: (() -> Void)?
  
  required init(appCoordinator: AppNavigationCoordinator, flowCompletionHandler: (() -> Void)?) {
    self.appCoordinator = appCoordinator
    self.flowCompletionHandler = flowCompletionHandler
  }
  
  func create(input: UserSessionController) -> UITabBarController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let tabController = storyboard.instantiateInitialViewController() as! MainTabBarController
    
    let feedController = storyboard.instantiateViewControllerWithIdentifier("FeedController")
    let profileController = storyboard.instantiateViewControllerWithIdentifier("ProfileController") as! ProfileController
    profileController.userSession = input.currentSession!
    profileController.completionHandler = { event in
      switch event {
      case .Logout:
        input.currentSession!.close()
        let welcomeEntryPoint = WelcomeFlowCoordinator(appCoordinator: self.appCoordinator, flowCompletionHandler: nil).create(input)
        self.appCoordinator.navigationContext.changeRootController(to: welcomeEntryPoint)
      }
    }
    tabController.setViewControllers([feedController, profileController], animated: false)
    
    navigationContext = tabController
    
    return navigationContext
  }
  
}