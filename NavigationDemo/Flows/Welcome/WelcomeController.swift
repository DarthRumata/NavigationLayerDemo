//
//  ViewController.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/16/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit
import SegueManager

enum WelcomeEvent {
  
  case Completed
}

class WelcomeController: SegueManagerViewController, Coordinatable {
  
  var completionHandler: (WelcomeFlowEvent -> Void)?

  @IBAction func presentLogin(sender: AnyObject) {
    completionHandler?(.ShowLogin)
  }
  
  @IBAction func presentSignUp(sender: AnyObject) {
    completionHandler?(.ShowSignUp)
  }
  
  @IBAction func presentAboutApp(sender: AnyObject) {
    completionHandler?(.ShowAboutApp)
  }
}

