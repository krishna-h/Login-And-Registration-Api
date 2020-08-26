//  APIManager.swift
//  User Registration and login API
//  Created by Mac on 22/05/20.
//  Copyright © 2020 Gunde Ramakrishna. All rights reserved.


import Foundation
import UIKit
import Alamofire

//CREATING APIERROR MESSAGE
enum APIError: Error{
    case custom(message: String)
}
typealias Handler = (Swift.Result<Any?, APIError>) -> Void


class APIManager {
    static let shareInstance = APIManager()
    
    // CREATING CALLINGREGISTERAPI FUNCTION
    func callingRegisterAPI(register: RegisterModel, completionHandeler: @escaping (Bool,String) -> ())
    {
        let headers:HTTPHeaders = [
        .contentType("application/json")
        ]
        AF.request(register_url, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response{ response in debugPrint(response)
            
            // RESULTS
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                    if response.response?.statusCode == 200{
                        completionHandeler(true, "User register Sucessfully")
                    }else{
                        completionHandeler(false, "Please try again")
                    }
                }catch{
                    print(error.localizedDescription)
                    completionHandeler(false, "Please try again")
             }
                
            case .failure(let err):
                print(err.localizedDescription)
                completionHandeler(false, "Please try again")
            }
        }
        
    }
    
    //CREATING CALLINGLOGINAPI FUNCTION
    func callingLoginAPI(login: LoginModel, completionHandeler: @escaping Handler)
       {
        let headers:HTTPHeaders = [
           .contentType("application/json")
           ]
        AF.request(login_url, method: .post, parameters: login, encoder: JSONParameterEncoder.default, headers: headers).response{ response in debugPrint(response)
               
        switch response.result{
        case .success(let data):
        do{
        let json = try JSONDecoder().decode(ResponseModel.self, from: data!)
        print(json)
//       let json = try JSONSerialization.jsonObject(with: data!, options: [])
        if response.response?.statusCode == 200{
        completionHandeler(.success(json))
        }else{
        completionHandeler(.failure(.custom(message: "Please check your network connectivity")))
                       }
        }catch{
        print(error.localizedDescription)
        completionHandeler(.failure(.custom(message: "Please try again")))
        }
                   
        case .failure(let err):
                   print(err.localizedDescription)
                   completionHandeler(.failure(.custom(message: "Please try again")))
               }
           }
           
       }
    
    // CREATING CALLINGLOGOUTAPI FUNCTION
    func callingLogOutAPI(vc: UIViewController){
        let headers: HTTPHeaders = ["user_token": "\(TokenService.tokenInstance.getToken())"]
        AF.request(logout_url, method: .get,  headers: headers).response{
            response in
            switch response.result{
            case.success(_):
            TokenService.tokenInstance.removeToken()
          // vc.navigationController?.popViewController(animated: true)
           // vc.dismiss(animated: true, completion: nil)
                let RegVC = RegisterViewController.sharInstance()
                vc.navigationController?.pushViewController(RegVC, animated: true)
            case.failure(let err):
            print(err.localizedDescription)
            }
        }
        }
}
