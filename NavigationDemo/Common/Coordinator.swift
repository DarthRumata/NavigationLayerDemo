//
//  Coordinatable.swift
//  NavigationDemo
//
//  Created by Rumata on 6/23/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation

protocol Coordinator: class {
  
  func start()
  
}

protocol FlowCoordinator: Routable, Coordinator {
  
  unowned var appCoordinator: ApplicationCoordinator { get }
  
  var flowCompletionHandler: (() -> Void)? { get }
  
  init(appCoordinator: ApplicationCoordinator, flowCompletionHandler: (() -> Void)?)
  
}

protocol Coordinatable {
  
  associatedtype NavigationEvent
  
  var completionHandler: ((NavigationEvent) -> Void)? { get }
  
}