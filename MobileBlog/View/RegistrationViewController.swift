//
//  RegistrationViewController.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 9/21/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    //    MARK:- Properies
    
    private let containerView = UIView()
    
    private let loginLabel = UILabel()
    private let passwordLabel = UILabel()
    private let loginTextField = UITextField()
    private let passwordTextField = UITextField()
    private let confirmPasswordTextField = UITextField()
    private let registrationButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureViews()
        configureNavigationBar()
    }
    
    @objc private func loginButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isUserInteractionEnabled = false
        
        navigationItem.title = "Registration"
        navigationItem.hidesBackButton = true
        
    }
    
    private func configureViews() {
        
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
        setupConfirmPasswordTextField()
        setupLoginButton()
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
        loginTextField.borderStyle = .roundedRect
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
        passwordTextField.borderStyle = .roundedRect
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
    
    private func setupConfirmPasswordTextField() {
        confirmPasswordTextField.borderStyle = .roundedRect
        confirmPasswordTextField.placeholder = "Password"
        confirmPasswordTextField.font = UIFont.systemFont(ofSize: 15)
        confirmPasswordTextField.borderStyle = .roundedRect
        confirmPasswordTextField.autocorrectionType = .no
        confirmPasswordTextField.keyboardType = .default
        confirmPasswordTextField.returnKeyType = .done
        confirmPasswordTextField.clearButtonMode = .whileEditing
        confirmPasswordTextField.contentVerticalAlignment = .center
        
        containerView.addSubview(confirmPasswordTextField)
        confirmPasswordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(8)
            make.trailing.leading.equalToSuperview()
            
        }
    }
    
    private func setupLoginButton() {
        registrationButton.setTitle("Register", for: .normal)
        registrationButton.setTitleColor(.black, for: .normal)
        registrationButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        registrationButton.tag = 1
        
        containerView.addSubview(registrationButton)
        registrationButton.snp.makeConstraints { (make) in
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(30)
            make.bottom.trailing.leading.equalToSuperview()
            
        }
    }
}
