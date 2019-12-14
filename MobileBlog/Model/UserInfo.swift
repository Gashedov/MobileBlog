//
//  UserInfo.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 11/21/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import Foundation

struct UserInfo {
    let id: Int
    let name: String
    let username : String
}

extension UserInfo: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case username 
    }
}

extension UserInfo: Equatable {}
