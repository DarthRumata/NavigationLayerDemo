//
//  WelcomeFlowCoordinator.swift
//  NavigationDemo
//
//  Created by Rumata on 6/23/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit
import SegueManager

enum WelcomeFlowEvent {
  case ShowLogin, ShowSignUp, ShowAboutApp
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
      case .ShowAboutApp:
        controller.performSegue(R.segue.welcomeController.presentAboutApp) { segue in
          segue.destinationViewController.path = "http://news.google.com"
        }
      }
    }
    navigationContext = controller
    
    return controller
  }
  
}