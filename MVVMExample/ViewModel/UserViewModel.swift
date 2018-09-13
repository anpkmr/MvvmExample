//
//  UserViewModel.swift
//  MVVMExample
//
//  Created by anoop on 9/13/18.
//  Copyright © 2018 anoop. All rights reserved.
//

import Foundation


enum ValidationState {
    case Valid
    case Invalid(String)
}


class LoginViewModel {
    private let minUsernameLenth = 4
    private let minPasswordLenght = 5
    
    var username:String = ""
    var password:String = ""
  
    func validate() -> ValidationState {
        if username.isEmpty && password.isEmpty {
            return .Invalid("Invalid user name and password")
        }
        if username.characters.count < minUsernameLenth {
            return .Invalid("username should be atleast \(minUsernameLenth) char long")
        }
        if password.characters.count < minPasswordLenght {
        return .Invalid("password should be atleast \(minPasswordLenght) char long")
        }
        return .Valid
    }
    
    func loginRequest(_ completion:@escaping ((_ resposne:Any?,_ error:Error?)->Void)) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            if self.username == "swiftUser" && self.password == "swiftPassword" {
                completion("user logged in", nil)
            } else {
                completion(nil,NSError(domain: Bundle.main.bundleIdentifier!, code: 400, userInfo: [NSLocalizedDescriptionKey:"Invlaid user name or password"]))
            }
        }
        
    }
    
}



