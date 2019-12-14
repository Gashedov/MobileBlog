//
//  PulbicationInfo.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 11/21/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import Foundation

struct PublicationInfo {
    let id: Int
    let name: String
    let body: String
    let userID: Int
}

extension PublicationInfo: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case body
        case userID
    }
}

extension PublicationInfo: Equatable {}
