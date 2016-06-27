//
//  Coordinatable.swift
//  NavigationDemo
//
//  Created by Rumata on 6/23/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation

protocol Coordinator: class, Routable {
  
  func start()
  
}

protocol FlowController {
  
  associatedtype NavigationEvent
  
  var completionHandler: ((NavigationEvent) -> Void)? { get }
  
}