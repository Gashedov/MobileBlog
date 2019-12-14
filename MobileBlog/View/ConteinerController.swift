//
//  ConteinerController.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 9/11/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import UIKit

/// Controller contains both homre and menu controllers and manages they displaying
class ContainerController: UIViewController {
    
    //MARK:- Properties
    
    /// left side munu controller
    private var menuController : MenuController!
    ///
    private var centerController:  UIViewController!
    private var isExpended = false
    private var userAcess: UserAccess = .unauthorized
    
    //MARK:- Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    //MARK:- public methods
    
    func setUserAccess(access : UserAccess) {
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
        homeController.menuDelegate = self
        
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
            NSLog("Menu controller configured")
        }
    }

    private func didSelectMenuOption(menuOption: MenuOptions) {
        let controller = centerController.children.last { (controller) -> Bool in
                controller is HomeController
        }
        
        guard let homeController = controller as? HomeController else {
            NSLog("Couldn't get home controller from navigation controller")
            return
        }

        switch menuOption {
            
        case .Posts:
            homeController.changeDataSet(to: .allPublications)
            print("Posts open")
        case .MyPosts:
            homeController.changeDataSet(to: .ownPublications)
            print("My posts open")
        case .LikedPosts:
            homeController.changeDataSet(to: .likedPublications)
            print("Liked posts open")
        case .NewPost:
            let postCreatingController = PostCreatingViewController()
            navigationController?.pushViewController(postCreatingController, animated: true)
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

