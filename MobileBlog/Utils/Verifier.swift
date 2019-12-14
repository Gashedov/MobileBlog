//
//  Verifier.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 11/27/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import Foundation

struct Verifier {
    
    private let allowedLoginCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890_"
    private let passwordLeghtRange = 3...20
    private let loginLenghtRange = 3...20
    private let publicationNameLenghtRange = 3...70
    private let publicationBodyLenghtRange = 70...10000
    
    func loginIsCorrect(login: String) -> Bool {
        if login.count < loginLenghtRange.lowerBound || login.count > loginLenghtRange.upperBound{
            return false
        }
        for char in Array(login) {
            if !allowedLoginCharacters.contains(char) {
                return false
            }
        }
        return true
    }
    
    func passwordIsCorrect(password: String) -> Bool {
        if password.count < passwordLeghtRange.lowerBound || password.count > passwordLeghtRange.upperBound {
            return false
        }
        return true
    }
    
    func PasswordsAreEqual(password: String, confirmation: String) -> Bool {
        return password == confirmation
    }
    
    func publicationNameIsCorrect(name: String) -> Bool {
        if name.count < publicationNameLenghtRange.lowerBound || name.count > publicationNameLenghtRange.upperBound {
            return false
        }
        return true
    }
    
    func publicationBodyIsCorrect(body: String) -> Bool {
        if body.count < publicationBodyLenghtRange.lowerBound || body.count > publicationBodyLenghtRange.upperBound {
            return false
        }
        return true
    }
}
