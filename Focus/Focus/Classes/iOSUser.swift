//
//  iOSUser.swift
//  Focus
//
//  Created by Shiheng Wang on 5/10/21.
//

import Foundation

class iOSUser {
    var userName: String
    var passWord: String
    var email: String
    init(uName: String, pw: String, e: String) {
        self.userName = uName
        self.passWord = pw
        self.email = e
    }
}
