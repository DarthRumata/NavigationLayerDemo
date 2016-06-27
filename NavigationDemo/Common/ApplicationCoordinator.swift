//
//  ApplicationCoordinator.swift
//  NavigationDemo
//
//  Created by Rumata on 6/23/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

final class ApplicationCoordinator: Coordinator {
  
  private unowned let window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
  }
  
  func start() {
    guard let session = UserSessionDemo.restoreSession() else {
      WelcomeFlowCoordinator(appCoordinator: self, flowCompletionHandler: nil).start()
      return
    }
   
    
  }
  
  func changeRootController(to controller: UIViewController) {
    window.rootViewController = controller
  }
  
}