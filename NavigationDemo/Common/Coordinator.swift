//
//  Coordinatable.swift
//  NavigationDemo
//
//  Created by Rumata on 6/23/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation

protocol Coordinator: class, Routable {
  
  associatedtype EntryPoint
  associatedtype InputData = Void
  
  func create(input: InputData) -> EntryPoint
  
}

protocol FlowCoordinator: Coordinator {
  
  unowned var appCoordinator: AppNavigationCoordinator { get }
  
  var flowCompletionHandler: (() -> Void)? { get }
  
  init(appCoordinator: AppNavigationCoordinator, flowCompletionHandler: (() -> Void)?)
  
}

protocol Coordinatable {
  
  associatedtype NavigationEvent
  
  var completionHandler: ((NavigationEvent) -> Void)? { get }
  
}