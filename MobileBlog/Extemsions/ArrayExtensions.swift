//
//  ArrayExtensions.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 11/29/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import Foundation

extension Array {
    subscript(safe index: Index) -> Element? {
        let isValidIndex = index >= 0 && index < count
        return isValidIndex ? self[index] : nil
    }
}
