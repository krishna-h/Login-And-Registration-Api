//
//  LogInModel.swift
//  User Registration and login API
//
//  Created by Mac on 23/05/20.
//  Copyright © 2020 Gunde Ramakrishna. All rights reserved.
//

import Foundation

struct LoginModel: Encodable {
    let login: String
    let password: String
}
struct LoginResponseModel {
    let name: String
    let email: String
}
