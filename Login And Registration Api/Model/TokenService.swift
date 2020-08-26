//
//  TokenService.swift
//  Registration And Login API
//
//  Created by Mac on 09/06/20.
//  Copyright © 2020 Gunde Ramakrishna. All rights reserved.
//

import Foundation
import UIKit
class TokenService{
    static let tokenInstance = TokenService()
    let userDefault = UserDefaults.standard
    func saveToken(token: String){
        userDefault.set(token, forKey: TokenKey.userLogin)
    }
    func getToken() -> String{
        //userDefault.string(forKey: TokenKey.userLogin)
        if let token = userDefault.object(forKey: TokenKey.userLogin) as? String{
            return token
        }else {
            return ""
        }
    }
    func checkForLogin() -> Bool{
        if getToken() == ""{
            return false
        }else{
            return true
        }
    }
    func removeToken(){
        userDefault.removeObject(forKey: TokenKey.userLogin)
    }
}
