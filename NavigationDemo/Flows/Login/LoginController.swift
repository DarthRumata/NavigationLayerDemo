//
//  LoginController.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/17/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

class LoginController: UIViewController, Coordinatable {
  
  var completionHandler: ((LoginFlowEvent) -> Void)?
  
  @IBOutlet private weak var usernameField: UITextField!
  
  @IBAction func performLogin(sender: AnyObject) {
    UserSessionDemo.login(username: usernameField.text!) { [weak self] (session, error) in
      if let session = session, _self = self {
        _self.completionHandler?(.ShowMainFlow(session: session))
      } else if let error = error {
        print(error)
      }
    }
  }
  
  @IBAction func dismiss(sender: AnyObject) {
    completionHandler?(.Close)
  }

}