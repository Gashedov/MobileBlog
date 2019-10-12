//
//  Protocols.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 9/11/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

protocol HomeControllerDelegate: class {
    func handleMenuToggle(menuOption: MenuOptions?)
}

protocol ViewModelDelegate: class {
    func dataRecieve()
}
