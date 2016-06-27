//
//  SignUpController.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/17/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

class SignUpController: UIViewController {
  
  var completionHandler: ((LoginFlowEvent) -> Void)?
  weak var userSessionController: UserSessionController!
  
  @IBOutlet private weak var usernameField: UITextField!
  
  @IBAction func performSignUp(sender: AnyObject) {
    userSessionController.signUp(username: usernameField.text!) { [weak self] (session, error) in
      if let _self = self where session != nil {
        _self.completionHandler?(.ShowMainFlow)
      } else if let error = error {
        print(error)
      }
    }
  }
  
  @IBAction func dismiss(sender: AnyObject) {
    completionHandler?(.Close)
  }
  
}