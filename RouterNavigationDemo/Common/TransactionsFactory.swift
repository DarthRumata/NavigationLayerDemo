//
//  TransactionsFactory.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/19/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

struct TransactionsFactory {
  
  static func welcomeScreenTransaction(window: UIWindow) -> Transaction {
    return WelcomeScreenTransaction(window: window)
  }
  
  static func mainTabBarScreenTransaction(window: UIWindow, userSession: UserSessionDemo) -> Transaction {
    return MainTabBarScreenTransaction(window: window, userSession: userSession)
  }
  
  static func loginScreenTransaction(sourceViewController: UIViewController) -> Transaction {
    return LoginScreenTransaction(sourceViewController: sourceViewController)
  }
  
  static func signUpScreenTransaction(sourceViewController: UIViewController) -> Transaction {
    return SignUpScreenTransaction(sourceViewController: sourceViewController)
  }
  
  static func feedScreenTransaction(tabBarController: UITabBarController) -> Transaction {
    return FeedScreenTransaction(tabBarController: tabBarController)
  }
  
  static func profileScreenTransaction(tabBarController: UITabBarController, userSession: UserSessionDemo) -> Transaction {
    return ProfileScreenTransaction(tabBarController: tabBarController, userSession: userSession)
  }
  
}