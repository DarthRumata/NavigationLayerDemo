//
//  ViewController.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/16/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController {

  @IBAction func presentLogin(sender: AnyObject) {
   TransactionsFactory.loginScreenTransaction(self).perform()
  }
  
  @IBAction func presentSignUp(sender: AnyObject) {
   TransactionsFactory.signUpScreenTransaction(self).perform()
  }
  
}

