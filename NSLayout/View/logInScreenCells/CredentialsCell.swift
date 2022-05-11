//
//  CredentialsCell.swift
//  NSLayout
//
//  Created by Mobile Team on 11/05/2022.
//

import UIKit

class CredentialsCell: UITableViewCell {

    let loginLabel : UILabel = {
        let loginLabel = UILabel()
        loginLabel.text = "Login"
        loginLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        // LoginLabel.font = .boldSystemFont(ofSize: 35)
        loginLabel.adjustsFontForContentSizeCategory = true
        loginLabel.textColor = .black
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        return loginLabel
    }()
    
    let emailTextField : UITextField = {
        let emailTextField = UITextField()
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.boldSystemFont(ofSize: 15.0)
        ])
        let atImage = UIImageView(frame: CGRect(x: 60, y: 0, width: 30, height: 30))
        atImage.image = UIImage(systemName: "at.circle")
        atImage.tintColor = .gray
        
        emailTextField.leftViewMode = .always
        emailTextField.leftView = atImage
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return emailTextField
    }()
    
    var passwordTextField : TextFieldWithPadding = {
        let passwordTextField = TextFieldWithPadding()
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.boldSystemFont(ofSize: 15.0)
        ])
        let lockImage = UIImageView()
        lockImage.image = UIImage(systemName: "lock" )
        lockImage.tintColor = .gray
        passwordTextField.isSecureTextEntry = true
        passwordTextField.leftViewMode = .always
        passwordTextField.leftView = lockImage
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let forgetButton = UIButton()
        forgetButton.setTitle("Forgot?", for: .normal)
        forgetButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        forgetButton.setTitleColor( UIColor(red: 0/255, green: 125/255, blue: 255/255, alpha: 1), for: .normal)
        
        passwordTextField.rightView = forgetButton
        passwordTextField.rightViewMode = .always
        
        return passwordTextField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(loginLabel)
        contentView.addSubview(emailTextField)
        contentView.addSubview(passwordTextField)

        loginLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive  = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
