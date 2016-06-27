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
  
  private(set) weak var presenter: UINavigationController?
  
  init(window: UIWindow) {
    
  }
  
  func start() {
    guard let session = UserSessionDemo.restoreSession() else {
      
      return
    }
    
   
    
  }
  
}