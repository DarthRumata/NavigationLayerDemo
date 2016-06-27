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

extension UIWindow: NavigationContext {
  
  func changeRootController(to controller: UIViewController) {
    rootViewController?.dismissViewControllerAnimated(false, completion: nil)
    rootViewController?.view.removeFromSuperview()
    
    rootViewController = controller
  }
  
}
extension UIViewController: NavigationContext {}

protocol Routable {
  
  associatedtype NavigationContextType: NavigationContext
  
  weak var navigationContext: NavigationContextType! { get }
  
}
