
//  Constant.swift
//  User Registration and login API
//  Created by Mac on 22/05/20.
//  Copyright © 2020 Gunde Ramakrishna. All rights reserved.


import Foundation
let app_id = "51A43F98-0CE6-BDF6-FF42-FCA2A821DA00"
let rest_key = "4E425ECB-EE91-49E8-AB55-3B8CC16AF81A"
let base_url = "https://api.backendless.com/\(app_id)/\(rest_key)/users/"
let register_url = "\(base_url)register"
let login_url = "\(base_url)login"
let logout_url = "\(base_url)logout"

struct TokenKey {
    static let userLogin = "USER_LOGIN_KEY"
}
