//
//  MenuController.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 9/11/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MenuTableViewCell"

class MenuController: UIViewController {
    //MARK:- Properties
    weak var delegate: HomeControllerDelegate?
    let tableView = UITableView()
    
    //MARK:- Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateTableView()
    }
    
    //MARK:- Hendlers
    
    private func configurateTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.backgroundColor = .darkGray
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
}

extension MenuController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MenuTableViewCell
        
        let menuOption = MenuOptions(rawValue: indexPath.row)
        cell.descriptionLabel.text = menuOption?.description
        cell.iconImageView.image = menuOption?.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOption = MenuOptions(rawValue: indexPath.row)
        
        //tell the container controller to close menu and open selected view
        delegate?.handleMenuToggle(menuOption: menuOption)
        
    }
    
    
}
