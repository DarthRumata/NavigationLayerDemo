//
//  UserSession.swift
//  RouterNavigationDemo
//
//  Created by Rumata on 6/17/16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation

private let userSessionRestoreKey = "userSessionId"
private let userDefaults = NSUserDefaults.standardUserDefaults()

enum UserSessionState {
  case Open, Closed
}

class UserSessionDemo: RawRepresentable {
  
  var currentUser: User {
    precondition(state == .Open, "Invalid session")
    
    return _user
  }
  
  let pathBuilder: PathBuilder
  private let id: String
  private let _user: User
  private(set) var state = UserSessionState.Open
  
  private init(id: String, user: User) {
    self.id = id
    self._user = user
    self.pathBuilder = PathBuilder(identifier: id, directory: .DocumentDirectory)
  }
  
  // MARK: StateCoder
  
  required init?(rawValue: RawValue) {
    if
      let id = rawValue["id"] as? String,
      userRaw = rawValue["user"] as? RawValue,
      currentUser = User(rawValue: userRaw)
    {
      self.id = id
      self._user = currentUser
      self.pathBuilder = PathBuilder(identifier: id, directory: .DocumentDirectory)
    } else {
      return nil
    }
  }
  
  var rawValue: RawValue {
    return [
      "id": id,
      "user": _user.rawValue
    ]
  }
  
  // MARK: Public API
  
  static func restoreSession() -> UserSessionDemo? {
    guard let sessionId = userDefaults.stringForKey(userSessionRestoreKey) else {
      return nil
    }
    
    let pathBuilder = PathBuilder(identifier: sessionId, directory: .DocumentDirectory)
    let coder = StateCoder(URL: pathBuilder.appendingComponent("session").url)
    let session: UserSessionDemo? = coder.decode()

    return session
  }
  
  static func login(username username: String, completion: (session: UserSessionDemo?, error: NSError?) -> Void) {
    let demoUser = User(id: "user1", username: username)
    let session =  UserSessionDemo(id: demoUser.id, user: demoUser)
    session.saveSession()
    
    completion(session: session, error: nil)
  }
  
  static func signUp(username username: String, completion: (session: UserSessionDemo?, error: NSError?) -> Void) {
    let demoUser = User(id: "user1", username: username)
    let session =  UserSessionDemo(id: demoUser.id, user: demoUser)
    session.saveSession()
    
    completion(session: session, error: nil)
  }
  
  func close() {
    state = .Closed
    userDefaults.removeObjectForKey(userSessionRestoreKey)
  }
  
  private func saveSession() {
    userDefaults.setObject(id, forKey: userSessionRestoreKey)
    userDefaults.synchronize()
    
    let url = pathBuilder.url
      let _ = try? NSFileManager.defaultManager().createDirectoryAtURL(
        url,
        withIntermediateDirectories: true, attributes: nil
      )
    
    let coder = StateCoder(URL: pathBuilder.appendingComponent("session").url)
    coder.encode(self)
  }
  
}
