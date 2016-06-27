//
//  ViewController.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/16/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

enum WelcomeEvent {
  
  case Completed
}

class WelcomeController: UIViewController, Coordinatable {
  
  var completionHandler: ((WelcomeFlowEvent) -> Void)?

  var dispatch: (WelcomeEvent -> Void)?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBAction func presentLogin(sender: AnyObject) {
    completionHandler?(.ShowLogin)
  }
  
  @IBAction func presentSignUp(sender: AnyObject) {
    completionHandler?(.ShowSignUp)
  }
  
}

