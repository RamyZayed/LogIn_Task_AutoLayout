//
//  RegisterCell.swift
//  NSLayout
//
//  Created by Mobile Team on 11/05/2022.
//

import UIKit

class RegisterCell: UITableViewCell {
    
    let newLabel : UILabel = {
        let newLabel = UILabel()
        newLabel.text = "New to our App?"
        newLabel.translatesAutoresizingMaskIntoConstraints = false
        return newLabel
    }()
    let registerButton : UIButton = {
        let registerButton = UIButton()
        registerButton.setTitle("Register", for: .normal)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.backgroundColor = .clear
        registerButton.setTitleColor(UIColor.blue, for: .normal)
        return registerButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addViews()
        setUpConstraints()
        
    }
    func addViews(){
        contentView.addSubview(registerButton)
        contentView.addSubview(newLabel)
    }
    func setUpConstraints(){
        newLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        newLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -35).isActive = true
        
        registerButton.topAnchor.constraint(equalTo: newLabel.topAnchor,constant: -7).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: newLabel.trailingAnchor).isActive = true
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
