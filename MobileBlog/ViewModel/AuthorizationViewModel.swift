//
//  AuthorizationViewModel.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 11/27/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import Foundation

class AuthorizationViewModel {
    
    weak var delegate: ViewModelDelegate!
    private let verifier: Verifier
    private let httpClient: HttpClient
    var data: AuthenticationInfo?
    var error: DataReceivingError?
    
    init() {
        verifier = Verifier()
        httpClient = HttpClient()
    }
    
    func logIn(login: String, password: String) {
        
         guard verifier.loginIsCorrect(login: login) else {
            self.error = .invalidLogin
            delegate.couseAnError()
            return
         }
        
        guard verifier.passwordIsCorrect(password: password) else {
           self.error = .invalidPassword
           delegate.couseAnError()
           return
        }
        
        httpClient.logIn(login: login, password: password) { (result) in
            switch result{
            case .success(let info):
                self.data = info
                UserDefaults.standard.set(info.token, forKey: "token")
                UserDefaults.standard.set(info.userID, forKey: "userID")
                self.delegate.dataRecieve()
                
            case .failure(let error):
                NSLog(error.description)
                self.error = .serverRejecting
                self.delegate.couseAnError()
            }
        }
    }
    
}
