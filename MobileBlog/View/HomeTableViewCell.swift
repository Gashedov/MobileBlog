//
//  HomeTableViewCell.swift
//  MobileBlog
//
//  Created by Artem Gorshkov on 9/21/19.
//  Copyright © 2019 Artem Gorshkov. All rights reserved.
//

import UIKit
import SnapKit

class HomeTableViewCell: UITableViewCell {

   let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.contentMode  = .scaleToFill
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Sample text"
        return label
    }()
    
    //MARK:- Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(snp.centerY)
            make.centerX.equalTo(snp.centerX)
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setValues(name: String) {
        descriptionLabel.text = name
    }

}
