//
//  LoginViewController.swift
//  Registration And Login API
//
//  Created by Mac on 09/06/20.
//  Copyright © 2020 Gunde Ramakrishna. All rights reserved.
//

import UIKit
import TweeTextField

class LoginViewController: UIViewController {

    //CREATING OUTLETS
    @IBOutlet weak var EmailTF: TweeActiveTextField!
    @IBOutlet weak var passwordTF: TweeActiveTextField!
    @IBOutlet weak var login: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //LOGIN BUTTON CORNER RADIUS
         login.layer.cornerRadius = login.layer.frame.height/2

        // Do any additional setup after loading the view.
    }
    
     // ACTION PERFORMED BY PRESSING LOGIN BUTTON
    @IBAction func onLoginBtn(_ sender: UIButton)
    {
     guard let email = EmailTF.text else {return}
             guard let password = passwordTF.text else {return}
             let modelLogin = LoginModel(login: email, password: password)
        // CALLING APIMANAGER AND CALLING LOGING API
             APIManager.shareInstance.callingLoginAPI(login: modelLogin) { (result) in
                //RESULTS
                 switch result{
                    //IF SUCESS CASE
                 case .success(let json):
                     print(json)
                     let name = (json as! ResponseModel).name
                     let email = (json as! ResponseModel).email
                     let userToken = (json as! ResponseModel).userToken
                     TokenService.tokenInstance.saveToken(token: userToken)
                     let homeVC = HomeViewController.sharInstance()
                     homeVC.strName = name
                     self.navigationController?.pushViewController(homeVC, animated: true)
                    
     //              print(json as AnyObject)
     //                let email = (json as AnyObject).value(forKey: "email") as! String
     //                let name  = (json as AnyObject).value(forKey: "name") as! String
     //                let modelResponseLogin = LoginResponseModel(name: name, email: email)
     //                print(modelResponseLogin)
                    
                    //IF FAILURE CASE
                 case.failure(let err):
                     print(err.localizedDescription)
                 }
             }
    }
    
    //NAVIGATION
    @IBAction func onRegisterBtn(_ sender: UIButton) {
        let RegVC = RegisterViewController.sharInstance()
        self.navigationController?.pushViewController(RegVC, animated: true)
    }
    
    }
    extension LoginViewController {
     static func sharInstance()-> LoginViewController{
    return LoginViewController.instantiateFromStoryboard("Login")
    }
    }
