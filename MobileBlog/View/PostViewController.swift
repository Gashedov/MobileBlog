//
//  PostViewController.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 9/23/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    private let bodyTextView = UITextView()
    private let likeButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureVeiws()
    }
    
    @objc private func likeButtonTapped() {
        NSLog("Like button tapped")
    }
    
    func setData(publication: PublicationInfo){
        bodyTextView.text = publication.body
    }
    
    private func configureVeiws() {
        
        bodyTextView.isEditable = false
        bodyTextView.font = UIFont.systemFont(ofSize: 15)
        bodyTextView.contentMode = .left
        
        view.addSubview(bodyTextView)
        bodyTextView.snp.makeConstraints { (make) in
            make.top.bottom.trailing.leading.equalToSuperview()
        }
        
        likeButton.setImage(UIImage(named: "baseline_settings_white_24dp"), for: .normal)
        likeButton.backgroundColor = .lightGray
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        
        
        view.addSubview(likeButton)
        likeButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 60, height: 60))
            make.bottom.trailing.equalToSuperview().offset(-8)
        }
    }
    
}
