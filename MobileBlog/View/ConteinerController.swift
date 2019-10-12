//
//  ConteinerController.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 9/11/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    //MARK:- Properties
    
    private var menuController : MenuController!
    private var centerController:  UIViewController!
    private var isExpended = false
    private var userAcess: UserAccess = .unauthorized
    
    //MARK:- Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    //MARK:- public methods
    
    func setUserAccess(access : UserAccess){
        userAcess = access
    }
    
    //MARK:- Hendlers
    
    private func animatePanel(shouldExpand: Bool, menuOption: MenuOptions?) {
        if shouldExpand {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
        }
        else {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }, completion: {(_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            })
        }
    }
    
   private func configureHomeController() {
        let homeController = HomeController()
        centerController = UINavigationController(rootViewController: homeController)
        homeController.delegate = self
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    private func configureMenuController() {
        if menuController == nil {
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("menu controller configured")
        }
    }
    
    private func didSelectMenuOption(menuOption: MenuOptions) {
        switch menuOption {
            
        case .Posts:
            print("Posts open")
        case .MyPosts:
            print("My posts open")
        case .LikedPosts:
            print("Liked posts open")
        case .NewPost:
            print("New post open")
        }
    }
}

extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle(menuOption: MenuOptions?) {
        switch userAcess {
            
        case .authorized:
            if !isExpended {
                configureMenuController()
            }
            isExpended = !isExpended
            animatePanel(shouldExpand: isExpended, menuOption: menuOption)
            
        case .unauthorized:
            let alert = UIAlertController(title: "Доступно только автиризированным пользователям", message: "Авторизируйетсь чтобы пользоваться", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
    }
}

