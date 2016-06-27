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
  
  func create() {
    guard let session = UserSessionDemo.restoreSession() else {
      let entryPoint = WelcomeFlowCoordinator(appCoordinator: self, flowCompletionHandler: nil).create()
      route(with: .ChangeRootTo(controller: entryPoint), animated: false)
      
      return
    }
   
    // TODO: Add mainflow
  }
  
}