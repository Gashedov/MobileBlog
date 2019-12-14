//
//  RegistrationViewModel.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 12/4/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import Foundation

class RegistrationViewModel{
    weak var delegate: ViewModelDelegate?
    private var verifier: Verifier
    var httpClient: HTTPClient
    var data: UserInfo?
    var error: DataReceivingError?
    
    init() {
        verifier = Verifier()
        httpClient = HttpClient()
    }
    
    func register(name: String, userName: String, password: String, passwordConfirmation: String) {
        guard verifier.loginIsCorrect(login: userName)
            else {
                error = .invalidLogin
                delegate?.couseAnError()
                return
        }
        guard verifier.loginIsCorrect(login: name)
            else {
                error = .invalidLogin
                delegate?.couseAnError()
                return
        }
        guard verifier.passwordIsCorrect(password: password)
            else {
                error = .invalidPassword
                delegate?.couseAnError()
                return
        }
        guard verifier.PasswordsAreEqual(password: password, confirmation: passwordConfirmation)
            else {
                error = .passwordsAreNotEqual
                delegate?.couseAnError()
                return
        }

        httpClient.registerUser(name: name, userName: userName, password: password) { (result) in
                   switch result{
                   case .success(let info):
                       self.data = info
                       self.delegate?.dataRecieve()

                   case .failure(let error):
                       NSLog(error.description)
                       self.error = .serverRejecting
                       self.delegate?.couseAnError()
                   }
               }
    }
}
