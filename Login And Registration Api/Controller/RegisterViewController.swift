//
//  RegisterViewController.swift
//  Registration And Login API
//
//  Created by Mac on 08/06/20.
//  Copyright © 2020 Gunde Ramakrishna. All rights reserved.
//

import UIKit
import TweeTextField

class RegisterViewController: UIViewController {
    
    // CREATING OUTLET
    @IBOutlet weak var EmailTF: TweeActiveTextField!
    @IBOutlet weak var passwordTF: TweeActiveTextField!
    @IBOutlet weak var firstNameTF: TweeActiveTextField!
    @IBOutlet weak var lastNameTF: TweeActiveTextField!
    @IBOutlet weak var save: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // TEXTFIELDS KEYBOARDTYPE
        EmailTF.keyboardType = .emailAddress
        passwordTF.keyboardType = .asciiCapableNumberPad
        passwordTF.isSecureTextEntry = true
        firstNameTF.keyboardType = .alphabet
        lastNameTF.keyboardType = .alphabet
        
       // SAVE BUTTION CORNERRADIUS
       save.layer.cornerRadius = save.layer.frame.height/2
      // Do any additional setup after loading the view.
        
    }
    

    // ACTION PERFORMED BY PRESSING SAVE BUTTON
    @IBAction func onSaveBtn(_ sender: UIButton)
    {
        guard let email = self.EmailTF.text else{return}
        guard let password = self.passwordTF.text else{return}
        guard let fname = self.firstNameTF.text else{return}
        guard let lname = self.lastNameTF.text else{return}
        let register = RegisterModel(name: fname + lname, email: email, password: password)
        // CALLING APIMANAGER AND CALLING REGESTER API
        APIManager.shareInstance.callingRegisterAPI(register: register) { (isSucess,str)  in
        if isSucess{
        let showAlert = UIAlertController(title: "Alert", message: str, preferredStyle:UIAlertController.Style.alert)
        showAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(showAlert, animated: true, completion: nil)
                       
        }else{
        let showAlert = UIAlertController(title: "Alert", message: str, preferredStyle:UIAlertController.Style.alert)
        showAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(showAlert, animated: true, completion: nil)
        }
        }
        }
    
    
   // NAVIGATING
    @IBAction func onLoginShiftBtn(_ sender: UIButton) {
    
    let LoginVC = LoginViewController.sharInstance()
    self.navigationController?.pushViewController(LoginVC, animated: true)
               
    }
   
    
    }



 extension RegisterViewController {
 static func sharInstance()-> RegisterViewController{
 return RegisterViewController.instantiateFromStoryboard("Register")
 }
 }


