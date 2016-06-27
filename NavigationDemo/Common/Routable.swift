//
//  Router.swift
//  NavigationDemo
//
//  Created by Rumata on 6/23/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

protocol Routable {
  
  weak var presenter: UINavigationController? { get }
  
  func present(controller: UIViewController, animated: Bool)
  func push(controller: UIViewController, animated: Bool)
  func popController(animated: Bool)
  func dismissController(animated: Bool)
  
}

extension Routable {
  
  func present(controller: UIViewController, animated: Bool) {
    presenter?.presentViewController(controller, animated: animated, completion: nil)
  }
  
  func push(controller:UIViewController, animated: Bool = true) {
    presenter?.pushViewController(controller, animated: animated)
  }
  
  func popController(animated: Bool = true) {
    presenter?.popViewControllerAnimated(animated)
  }
  
  func dismissController(animated: Bool = true) {
    presenter?.dismissViewControllerAnimated(true, completion: nil)
  }
  
}
