//
//  ViewController.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/16/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController {
  
  var router: WelcomeRouterInterface!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBAction func presentLogin(sender: AnyObject) {
    router.presentLoginModule()
  }
  
  @IBAction func presentSignUp(sender: AnyObject) {
    router.presentSignUpModule()
  }
  
}

