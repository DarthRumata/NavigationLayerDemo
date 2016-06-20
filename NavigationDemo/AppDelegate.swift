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


  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    window = UIWindow()
    window!.backgroundColor = .whiteColor()
    
    if let userSession = UserSessionDemo.restoreSession() {
      TransactionsFactory.mainTabBarScreenTransaction(window!, userSession: userSession).perform()
    } else {
      TransactionsFactory.welcomeScreenTransaction(window!).perform()
    }
    
    window!.makeKeyAndVisible()
    
    return true
  }

}

