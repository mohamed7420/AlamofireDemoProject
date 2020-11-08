//
//  ServiceManager.swift
//  AlamofireDemoProject
//
//  Created by Mohamed on 11/7/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation
import Alamofire


protocol ServiceMangerDelegate {
    
    func login(email: String , password: String , completion: () -> ())
    func register(email: String , password: String , passwordConfirmation: String , completion: ()->())
}

class ServiceManager: ServiceMangerDelegate{
    
     func login(email: String , password: String , completion: () -> ()){
        
        guard let url = URL(string: "https://api-ecomm.herokuapp.com/users/sign_in") else {return}
        
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).responseJSON { (response) in
            
            guard let statusCode = response.response?.statusCode else {return}
            
            if statusCode == 200{
                
                guard let responseJson = try? response.result.get() else {return}
                
                print(responseJson)
            }else{
                
                print("error")
            }
        }
    }
    
    func register(email: String , password: String , passwordConfirmation: String , completion: ()->()){
        
        guard let url = URL(string: "https://api-ecomm.herokuapp.com/users") else {return}
        
        let parameters: [String: Any] = [
            "email": email,
            "password": password,
            "password_confirmation": passwordConfirmation
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).responseJSON { (response) in
            
            guard let statusCode = response.response?.statusCode else {return}
            
            if statusCode == 200{
                
                guard let responseJson = try? response.result.get() else {return}
                
                print(responseJson)
            }else{
                
                print("error")
            }
        }
    }
}
