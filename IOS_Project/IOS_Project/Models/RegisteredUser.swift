//
//  RegisteredUser.swift
//  IOS_Project
//
//  Created by Gabriel Roger on 15/02/2019.
//  Copyright © 2019 Gabriel Roger. All rights reserved.
//

class RegisteredUser {
    static var user: User?
    static let instance: RegisteredUser = RegisteredUser()
    
    static func createUser(user: User){
        self.user = user
    }
}
