//
//  User.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/17/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation

class User: RawRepresentable {
  
  let id: String
  let username: String
  
  init(id: String, username: String) {
    self.id = id;
    self.username = username;
  }
  
  // MARK: StateCoder
  
  required init?(rawValue: RawValue) {
    if let id = rawValue["id"] as? String, username = rawValue["username"] as? String {
      self.id = id
      self.username = username
    } else {
      return nil
    }
  }

  var rawValue: RawValue {
    return [
      "id" : id,
      "username": username
    ]
  }
  
}
