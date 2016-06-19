//
//  Router.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/17/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

protocol Router {
  
  associatedtype Context
  func execute(context: Context)
  
}

protocol DefaultRouting: Router {
  
  weak var currentController: UIViewController! { get }
  
}

protocol Dismissable  {
  
  func dismiss()
  
}

extension Dismissable where Self: DefaultRouting {
  
  func dismiss() {
    currentController.dismissViewControllerAnimated(true, completion: nil)
  }
  
}