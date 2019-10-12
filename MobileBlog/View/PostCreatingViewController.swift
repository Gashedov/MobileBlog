//
//  PostCreatingViewController.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 9/23/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import UIKit

class PostCreatingViewController: UIViewController {
    
    private let containerView = UIView()

    private let themeLabel = UILabel()
    private let themeTextField = UITextField()
    private let bodyLabel = UILabel()
    private let bodyTextField = UITextField()
    private let submitButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc private func submitButtonPressed() {
        
    }
    
    //    MARK:- UI configurations
    
    private func configureViews() {
        view.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-30)
            make.leading.greaterThanOrEqualToSuperview().offset(80)
            make.trailing.lessThanOrEqualToSuperview().offset(-80)
            make.centerX.equalToSuperview()
        }
        setupThemeLabel()
        setupThemeTextField()
        setupBodyLabel()
        setupBodyTextField()
        setupSubmitButton()
        
    }
    
    private func setupThemeLabel(){
        themeLabel.text = "Theme"
        
        themeLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
        }
        
    }
    
    private func setupThemeTextField() {
        
        themeTextField.borderStyle = .roundedRect
        themeTextField.placeholder = "Enter your theme..."
        themeTextField.font = UIFont.systemFont(ofSize: 15)
        themeTextField.autocorrectionType = .no
        themeTextField.keyboardType = .default
        themeTextField.returnKeyType = .done
        themeTextField.clearButtonMode = .whileEditing
        themeTextField.contentVerticalAlignment = .center
        
        containerView.addSubview(themeTextField)
        themeTextField.snp.makeConstraints { (make) in
            make.top.equalTo(themeLabel.snp.bottom).offset(8)
            make.trailing.leading.equalToSuperview()
        }
    }
    
    private func setupBodyLabel() {
        bodyLabel.text = "Body"
        
        containerView.addSubview(bodyLabel)
        bodyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(themeTextField.snp.bottom).offset(30)
            make.trailing.leading.equalToSuperview()
        }
    }
    
    private func setupBodyTextField() {
        bodyTextField.borderStyle = .roundedRect
        bodyTextField.placeholder = "Write your story here..."
        bodyTextField.font = UIFont.systemFont(ofSize: 15)
        bodyTextField.autocorrectionType = .no
        bodyTextField.keyboardType = .default
        bodyTextField.returnKeyType = .done
        bodyTextField.clearButtonMode = .whileEditing
        bodyTextField.contentVerticalAlignment = .center
        
        containerView.addSubview(bodyTextField)
        bodyTextField.snp.makeConstraints { (make) in
            make.top.equalTo(bodyLabel.snp.bottom).offset(8)
            make.trailing.leading.equalToSuperview()
            
        }
    }
    
    private func setupSubmitButton() {
        submitButton.setTitle("Log in", for: .normal)
        submitButton.setTitleColor(.black, for: .normal)
        submitButton.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        
        containerView.addSubview(submitButton)
        submitButton.snp.makeConstraints { (make) in
            make.top.equalTo(bodyTextField.snp.bottom).offset(30)
            make.trailing.bottom.leading.equalToSuperview()
            
        }
    }

    
    
}
