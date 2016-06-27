//
//  AppDelegate.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/16/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  private var coordinator: AppNavigationCoordinator!

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    window = UIWindow()
    window!.backgroundColor = .whiteColor()
    window!.makeKeyAndVisible()
    
    coordinator = AppNavigationCoordinator(window: window!)
    coordinator.create()
     
    return true
  }

}

