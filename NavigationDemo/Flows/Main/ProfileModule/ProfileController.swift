//
//  ProfileController.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/18/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation
import UIKit

class ProfileController: UIViewController, Coordinatable {
  
  var completionHandler: ((MainTabBarFlowEvent) -> Void)?
  
  weak var userSession: UserSessionDemo!
  
  @IBOutlet private weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    tableView.delegate = self
    tableView.tableFooterView = UIView()
  }
  
}

extension ProfileController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell: UITableViewCell
    if indexPath.row == 0 {
      cell = tableView.dequeueReusableCellWithIdentifier("UsernameCell", forIndexPath: indexPath)
      cell.detailTextLabel?.text = userSession.currentUser.username
    } else {
      cell = tableView.dequeueReusableCellWithIdentifier("LogoutCell", forIndexPath: indexPath)
      (cell as! LogoutCell).logoutCallback = { [unowned self] in
        self.completionHandler?(.Logout)
      }
    }
    
    return cell
  }
  
}
