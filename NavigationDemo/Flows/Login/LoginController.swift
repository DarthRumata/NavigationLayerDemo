//
//  LoginController.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/17/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

class LoginController: UIViewController {
  
  var router: LoginRouterInterface!
  
  @IBOutlet private weak var usernameField: UITextField!
  
  @IBAction func performLogin(sender: AnyObject) {
    UserSessionDemo.login(username: usernameField.text!) { [weak self] (session, error) in
      if let session = session {
        self?.router.presentMainTabBarModule(with: session)
      } else if let error = error {
        print(error)
      }
    }
  }
  
  @IBAction func dismiss(sender: AnyObject) {
    router.dismiss()
  }

}