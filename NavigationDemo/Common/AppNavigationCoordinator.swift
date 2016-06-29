//
//  ApplicationCoordinator.swift
//  NavigationDemo
//
//  Created by Rumata on 6/23/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

typealias FlowCompletionHandler = AppNavigationEvent -> Void

enum AppNavigationEvent {
  case PresentWelcomeFlow, PresentMainFlow
}

final class AppNavigationCoordinator: Coordinator {
  
  weak var navigationContext: UIWindow!
  
  init(window: UIWindow) {
    self.navigationContext = window
  }
  
  func create(input: UserSessionController) {
    var appHandler: FlowCompletionHandler!
    
    func presentWelcomeFlow() {
      let entryPoint = WelcomeFlowCoordinator(flowCompletionHandler: appHandler).create(input)
      navigationContext.rootViewController = entryPoint
    }
    
    func presentMainFlow() {
      let mainEntryPoint = MainTabBarCoordinator(flowCompletionHandler: appHandler).create(input)
      navigationContext.changeRootController(to: mainEntryPoint)
    }
    
    appHandler = { event in
      switch event {
      case .PresentWelcomeFlow:
        presentWelcomeFlow()
      case .PresentMainFlow:
        presentMainFlow()
      }
    }
    
    guard input.currentSession != nil else {
      presentWelcomeFlow()
      
      return
    }

    presentMainFlow()
  }
  
 
  
}