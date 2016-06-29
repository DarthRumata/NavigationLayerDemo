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
  var flowCompletionHandler: FlowCompletionHandler?
  
  required init(flowCompletionHandler: FlowCompletionHandler?) {
    self.flowCompletionHandler = flowCompletionHandler
  }
  
  func create(input: UserSessionController) -> WelcomeController {
    let controller = R.storyboard.welcome.initialViewController()!
    controller.completionHandler = { event in
      switch event {
      case .ShowLogin:
        let entryPoint = LoginFlowCoordinator(
          flowCompletionHandler: self.flowCompletionHandler
          ).create(input)
        self.navigationContext.presentViewController(entryPoint, animated: true, completion: nil)
      case .ShowSignUp:
        let entryPoint = SignUpFlowCoordinator(
          flowCompletionHandler: self.flowCompletionHandler
          ).create(input)
        self.navigationContext.presentViewController(entryPoint, animated: true, completion: nil)
      }
    }
    navigationContext = controller
    
    return controller
  }
  
}