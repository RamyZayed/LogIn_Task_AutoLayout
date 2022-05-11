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
        heightAnchor.constraint(equalToConstant: 200 ).isActive = true
        addSubview(upperImage)
        upperImage.translatesAutoresizingMaskIntoConstraints = false
        upperImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        upperImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        upperImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
        upperImage.widthAnchor.constraint(equalTo: upperImage.heightAnchor , multiplier: 1).isActive = true
                
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
