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
  
  @IBOutlet private weak var usernameField: UITextField!
  
  @IBAction func performSignUp(sender: AnyObject) {
    UserSessionDemo.login(username: usernameField.text!) { [weak self] (session, error) in
      if let session = session {
        //TODO: go to main
      } else if let error = error {
        print(error)
      }
    }
  }
  
  @IBAction func dismiss(sender: AnyObject) {
    
  }
  
}