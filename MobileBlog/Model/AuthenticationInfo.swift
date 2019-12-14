//
//  BasicResponse.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 11/19/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import Foundation

struct AuthenticationInfo {
    let id: Int
    let token: String
    let userID: Int
}

extension AuthenticationInfo: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case token
        case userID
    }
}
