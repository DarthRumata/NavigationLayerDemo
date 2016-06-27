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
  
  func close() {
    state = .Closed
    userDefaults.removeObjectForKey(userSessionRestoreKey)
  }
  
  // MARK: Private API
  
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

final class UserSessionController {
  
  var currentSession: UserSessionDemo? {
    return _userSession
  }
  
  private var _userSession: UserSessionDemo!
  
  init() {
    restoreSession()
  }
  
  func restoreSession() {
    guard let sessionId = userDefaults.stringForKey(userSessionRestoreKey) else {
      return
    }
    
    let pathBuilder = PathBuilder(identifier: sessionId, directory: .DocumentDirectory)
    let coder = StateCoder(URL: pathBuilder.appendingComponent("session").url)
    _userSession = coder.decode()
  }
  
  func login(username username: String, completion: (session: UserSessionDemo?, error: NSError?) -> Void) {
    let demoUser = User(id: "user1", username: username)
    _userSession = UserSessionDemo(id: demoUser.id, user: demoUser)
    _userSession.saveSession()
    
    completion(session: _userSession, error: nil)
  }
  
  func signUp(username username: String, completion: (session: UserSessionDemo?, error: NSError?) -> Void) {
    let demoUser = User(id: "user1", username: username)
    _userSession = UserSessionDemo(id: demoUser.id, user: demoUser)
    _userSession.saveSession()
    
    completion(session: _userSession, error: nil)
  }
  
}
