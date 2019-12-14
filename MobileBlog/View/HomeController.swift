//
//  HomeController.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 9/11/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    //MARK:- Properties
    
    private let reusableIdentifier = "HomeTableVeiewCell"
    let tableView = UITableView()
    
    weak var menuDelegate: HomeControllerDelegate?
    private let viewModel = HomeViewModel()
    
    //MARK:- Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
        configureTableView()
        viewModel.delegate = self
        viewModel.getData()
    }
    
    func changeDataSet(to option: PublicationDataOption){
        viewModel.changeDataSet(to: option)
    }
    
    //MARK:- Hendlers
    
    @objc func handleMenuTaggle() {
        //tells the container controller to open menu bar
        menuDelegate?.handleMenuToggle(menuOption: nil)
    }
    
    // MARK:- Configuration
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 80
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    private func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Mobile blog"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuTaggle))
        
    }
}

//MARK:- Extensions

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier) as? HomeTableViewCell else {
            return HomeTableViewCell()
        }
        let name = viewModel.data[safe: indexPath.row]?.name ?? ""
        cell.setValues(name: name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController = PostViewController()
        nextViewController.setData(publication: viewModel.data[indexPath.row])
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension HomeController: ViewModelDelegate {
    func dataRecieve() {
        tableView.reloadData()
    }
    
    func couseAnError() {
    }
    
    
}
