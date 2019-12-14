//
//  DataReceiveingError.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 11/27/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import Foundation

enum DataReceivingError {
    case invalidLogin
    case invalidPassword
    case passwordsAreNotEqual
    case serverRejecting
    
    var descridtion: String {
        switch self {
        case .invalidLogin:
            return "Invalid login"
        case .invalidPassword:
            return "Invalid password"
        case .passwordsAreNotEqual:
            return "Passwords are not equal"
        case .serverRejecting:
            return "Server rejects the requsest"
        }
    }
}

enum PublicationDataReceivingError {
    case invalidPublicationName
    case invalidPublicationBody
    case serverRejecting
    
    var descriotion: String {
        switch self {
        case .invalidPublicationBody:
            return "Invalid publication body"
        case .invalidPublicationName:
            return "Invalid piblication name"
        case .serverRejecting:
            return "Server rejects the request"
        }
    }
}
