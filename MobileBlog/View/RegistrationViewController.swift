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
    
    private var viewModel: RegistrationViewModel!
    
    private let containerView = UIView()
    
    private let userNameLabel = UILabel()
    private let passwordLabel = UILabel()
    private let nameLabel = UILabel()
    private let userNameTextField = UITextField()
    private let nameTextField = UITextField()
    private let passwordTextField = UITextField()
    private let confirmPasswordTextField = UITextField()
    private let registrationButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RegistrationViewModel()
        view.backgroundColor = .white
        configureViews()
        configureNavigationBar()
    }
    
    @objc private func loginButtonPressed() {
        let userName = userNameTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let password  = passwordTextField.text ?? ""
        let passwordConfirmation = confirmPasswordTextField.text ?? ""
        viewModel.register(name: name, userName: userName, password: password, passwordConfirmation: passwordConfirmation)
        //navigationController?.popViewController(animated: true)
    }
    
    private func showAlert(with message: String) {
        let alert = UIAlertController(title: "Ошибка регистрации", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
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
        setupUserNameLabel()
        setupUserNameTextField()
        setupNameLabel()
        setupNameTextField()
        setupPasswordLabel()
        setupPasswordTextField()
        setupConfirmPasswordTextField()
        setupLoginButton()
    }
    
    private func setupUserNameLabel() {
        userNameLabel.text = "Username"
        
        containerView.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
        }
    }
    
    private func setupUserNameTextField() {
        
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.placeholder = "Username"
        userNameTextField.font = UIFont.systemFont(ofSize: 15)
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.autocorrectionType = .no
        userNameTextField.keyboardType = .default
        userNameTextField.returnKeyType = .done
        userNameTextField.clearButtonMode = .whileEditing
        userNameTextField.contentVerticalAlignment = .center
        
        containerView.addSubview(userNameTextField)
        userNameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(userNameLabel.snp.bottom).offset(8)
            make.trailing.leading.equalToSuperview()
        }
    }
    
    private func setupNameLabel() {
        nameLabel.text = "Name"
        
        containerView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userNameTextField.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    private func setupNameTextField() {
        
        nameTextField.borderStyle = .roundedRect
        nameTextField.placeholder = "Name"
        nameTextField.font = UIFont.systemFont(ofSize: 15)
        nameTextField.borderStyle = .roundedRect
        nameTextField.autocorrectionType = .no
        nameTextField.keyboardType = .default
        nameTextField.returnKeyType = .done
        nameTextField.clearButtonMode = .whileEditing
        nameTextField.contentVerticalAlignment = .center
        
        containerView.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.trailing.leading.equalToSuperview()
        }
    }
    
    private func setupPasswordLabel() {
        passwordLabel.text = "Password"
        
        containerView.addSubview(passwordLabel)
        passwordLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameTextField.snp.bottom).offset(30)
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

extension RegistrationViewController: ViewModelDelegate {
    func dataRecieve() {
        navigationController?.popViewController(animated: true)
    }
    
    func couseAnError() {
        guard let error = viewModel.error else {
            NSLog("Could't handle error data")
            return
        }
        showAlert(with: error.descridtion)
    }
    
    
}
