//
//  Router.swift
//  NavigationDemo
//
//  Created by Rumata on 6/23/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

protocol NavigationContext: class {}

extension UIWindow: NavigationContext {}
extension UIViewController: NavigationContext {}

enum Route {
  case Present(controller: UIViewController), Dismiss
  case Push(controller: UIViewController), Pop
  case ChangeRootTo(controller: UIViewController)
}

protocol Routable {
  
  associatedtype NavigationContextType: NavigationContext
  
  weak var navigationContext: NavigationContextType! { get }
  
  func route(with type: Route, animated: Bool)
  
}

extension Routable where NavigationContextType: UIViewController {
  
  func route(with type: Route, animated: Bool = true) {
    switch type {
    case .Present(let controller):
      navigationContext.presentViewController(controller, animated: animated, completion: nil)
    case .Dismiss:
      navigationContext.dismissViewControllerAnimated(true, completion: nil)
    default:
      fatalError("unsupported route")
    }
  }
  
}

extension Routable where NavigationContextType: UINavigationController {
  
  func route(with type: Route, animated: Bool = true) {
    switch type {
      
    case .Present(_):
      fallthrough
    case .Dismiss:
      
    case .Push(let controller):
      navigationContext.pushViewController(controller, animated: animated)
    case .Pop:
      navigationContext.popViewControllerAnimated(animated)
    default:
      fatalError("unsupported route")
    }
  }
  
}

extension Routable where NavigationContextType: UIWindow {
  
  func route(with type: RouteType, animated: Bool = true) {
    if case .ChangeRootTo(let controller) = type {
      // TODO: Add animation mode
      navigationContext.rootViewController = controller
    } else {
      fatalError("unsupported route")
    }
  }
  
}
