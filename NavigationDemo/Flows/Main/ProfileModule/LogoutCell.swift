//
//  ProfileUsernameCell.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/18/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

class LogoutCell: UITableViewCell {
  
  var logoutCallback: (() -> Void)!
  
  @IBAction func performLogout(sender: AnyObject) {
    logoutCallback()
  }
  
}