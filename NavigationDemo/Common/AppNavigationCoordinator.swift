//
//  ApplicationCoordinator.swift
//  NavigationDemo
//
//  Created by Rumata on 6/23/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

final class AppNavigationCoordinator: Coordinator {
  
  weak var navigationContext: UIWindow!
  
  init(window: UIWindow) {
    self.navigationContext = window
  }
  
  func create(input: UserSessionController) {
    guard input.currentSession != nil else {
      let entryPoint = WelcomeFlowCoordinator(appCoordinator: self, flowCompletionHandler: nil).create(input)
      navigationContext.rootViewController = entryPoint
      
      return
    }
   
    let mainEntryPoint = MainTabBarCoordinator(appCoordinator: self, flowCompletionHandler: nil).create(input)
    navigationContext.changeRootController(to: mainEntryPoint)
  }
  
}