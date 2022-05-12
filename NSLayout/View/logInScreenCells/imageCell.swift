//
//  TableViewCell.swift
//  NSLayout
//
//  Created by Mobile Team on 11/05/2022.
//

import UIKit

class imageCell: UITableViewCell {
    
    let upperImage :UIImageView = {
        let upperImage = UIImageView()
        upperImage.image = UIImage(named: "account.png")
        return upperImage
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        //heightAnchor.constraint(equalToConstant: 200 ).isActive = true
        contentView.addSubview(upperImage)
        
        upperImage.translatesAutoresizingMaskIntoConstraints = false
        upperImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20).isActive = true
        upperImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        upperImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        upperImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        upperImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        upperImage.widthAnchor.constraint(equalTo: upperImage.heightAnchor , multiplier: 1).isActive = true
                
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
