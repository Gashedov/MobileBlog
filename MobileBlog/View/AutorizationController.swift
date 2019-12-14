//
//  AutorizationController.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 9/17/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import UIKit
import SnapKit

class AutorizationController: UIViewController {
    
//    MARK:- Properties
    private let httpClient = HttpClient()
    private let verifyer = Verifier()
    private let viewModel = AuthorizationViewModel()
    
    private let containerView = UIView()
    
    private let loginLabel = UILabel()
    private let passwordLabel = UILabel()
    private let loginTextField = UITextField()
    private let passwordTextField = UITextField()
    private let registrationButton = UIButton()
    private let loginButton = UIButton()
    private let enterWithupLoginButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        view.backgroundColor = .white
        configurateViews()
        configureNavigationBar()
        // mb should init containerController here to preload publication list

    }
    
    //    MARK:- Private methods
    
    private func showAlert(with message: String) {
        let alert = UIAlertController(title: "Ошибка авторизации", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func ShowHomeViewController(withOption option: UserAccess) {
        let nextController = ContainerController()
        nextController.modalPresentationStyle = .fullScreen
        nextController.setUserAccess(access: option)
        present(nextController, animated: true, completion: nil)
    }
    
//    MARK:- Buttons handlers
    
    @objc private func loginButtonPressed() {
        let login = loginTextField.text ?? ""
        let password  = passwordTextField.text ?? ""
        viewModel.logIn(login: login, password: password)
    }
    
    @objc private func enterWithoutLoginButtonPressed() {
        ShowHomeViewController(withOption: .unauthorized)
    }
    
    @objc private func registrationButtonPressed() {
        let registrationController = RegistrationViewController()
        self.navigationController?.pushViewController(registrationController, animated: true)
    }
    
    
    //    MARK:- UI Configuration
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Autorization"
        
    }

    
    private func configurateViews() {
  
        view.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-30)
            make.leading.greaterThanOrEqualToSuperview().offset(80)
            make.trailing.lessThanOrEqualToSuperview().offset(-80)
            make.centerX.equalToSuperview()
        }
        setupLoginLabel()
        setupLoginTextField()
        setupPasswordLabel()
        setupPasswordTextField()
        setupLoginButton()
        setupRegistrationButton()
        setupEnterWithoutLoginButton()
    }
    
    private func setupLoginLabel() {
        loginLabel.text = "Login"
        
        containerView.addSubview(loginLabel)
        loginLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
        }
    }
    
    private func setupLoginTextField() {
        
        loginTextField.borderStyle = .roundedRect
        loginTextField.placeholder = "Login"
        loginTextField.font = UIFont.systemFont(ofSize: 15)
        loginTextField.autocorrectionType = .no
        loginTextField.keyboardType = .default
        loginTextField.returnKeyType = .done
        loginTextField.clearButtonMode = .whileEditing
        loginTextField.contentVerticalAlignment = .center
        
        containerView.addSubview(loginTextField)
        loginTextField.snp.makeConstraints { (make) in
            make.top.equalTo(loginLabel.snp.bottom).offset(8)
            make.trailing.leading.equalToSuperview()
        }
    }
    
    private func setupPasswordLabel() {
        passwordLabel.text = "Password"
        
        containerView.addSubview(passwordLabel)
        passwordLabel.snp.makeConstraints { (make) in
            make.top.equalTo(loginTextField.snp.bottom).offset(30)
            make.trailing.leading.equalToSuperview()
        }
    }
    
    private func setupPasswordTextField() {
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Password"
        passwordTextField.font = UIFont.systemFont(ofSize: 15)
        passwordTextField.autocorrectionType = .no
        passwordTextField.keyboardType = .default
        passwordTextField.returnKeyType = .done
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.contentVerticalAlignment = .center
        
        containerView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(passwordLabel.snp.bottom).offset(8)
            make.trailing.leading.equalToSuperview()
            
        }
    }
    
    private func setupLoginButton() {
        loginButton.setTitle("Log in", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        
        containerView.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.trailing.leading.equalToSuperview()
            
        }
    }
    
    private func  setupRegistrationButton() {
        registrationButton.setTitle("Register", for: .normal)
        registrationButton.setTitleColor(.black, for: . normal)
        registrationButton.addTarget(self, action: #selector(registrationButtonPressed), for: .touchUpInside)
        
        containerView.addSubview(registrationButton)
        registrationButton.snp.makeConstraints { (make) in
            make.top.equalTo(loginButton.snp.bottom).offset(30)
            make.trailing.leading.equalToSuperview()
        }
    }
    
    private func setupEnterWithoutLoginButton() {
        enterWithupLoginButton.setTitle("Log in without login", for: .normal)
        enterWithupLoginButton.setTitleColor(.black, for: .normal)
        enterWithupLoginButton.addTarget(self, action: #selector(enterWithoutLoginButtonPressed), for: .touchUpInside)

        
        containerView.addSubview(enterWithupLoginButton)
        enterWithupLoginButton.snp.makeConstraints { (make) in
            make.top.equalTo(registrationButton.snp.bottom).offset(50)
            make.bottom.trailing.leading.equalToSuperview()
        }
    }
}

//  MARK:- Extensions

extension AutorizationController: ViewModelDelegate {
    func couseAnError() {
        guard let error = viewModel.error else {
            NSLog("Could't handle error data")
            return
        }
        showAlert(with: error.descridtion)
    }
    
    func dataRecieve() {
        ShowHomeViewController(withOption: .authorized)
    }
}
