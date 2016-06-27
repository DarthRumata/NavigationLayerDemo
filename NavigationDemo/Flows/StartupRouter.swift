//
//  StartupRouter.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/17/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

class StartupRouter: Router {
  
  func execute(context: UIWindow) {
    guard let session = UserSessionDemo.restoreSession() else {
      WelcomeRouter().execute(context)
      
      return
    }
    
    MainTabBarRouter(userSession: session).execute(context)
  }
  
}