//
//  CredentialsCell.swift
//  NSLayout
//
//  Created by Mobile Team on 11/05/2022.
//

import UIKit

class CredentialsCell: UITableViewCell {
    var handler : (() -> ())?
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
    
    
    let emailTextField : TextFieldWithBottomLine = {
        let emailTextField = TextFieldWithBottomLine()
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
    
    let logInButton :  UIButton = {
        let logInButton = UIButton()
        logInButton.layer.cornerRadius = 10
        logInButton.setTitle("Login", for: .normal)
        logInButton.backgroundColor  = .systemBlue
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        return logInButton
    }()
    
    var passwordTextField : TextFieldWithBottomLine = {
        let passwordTextField = TextFieldWithBottomLine()
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
        contentView.addSubview(logInButton)
        selectionStyle = .none
        
        
        setUpConstraints()
        logInButton.addTarget(self, action: #selector(clicked), for: .touchUpInside)

    }
    @objc func clicked() {
        let animation  = CABasicAnimation()
        animation.keyPath = "transform.scale"
        animation.duration = 0.6
        animation.fromValue = 1
        animation.toValue = 0.95
        animation.autoreverses = true
        animation.repeatCount = 1
        logInButton.layer.add(animation, forKey: nil)
        handler?()
    }
    
    func setUpConstraints(){
        loginLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10).isActive = true
        loginLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        loginLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8).isActive = true
        
        
        emailTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor,constant: 16).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -12).isActive  = true
        
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 25).isActive  = true
        passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        
        logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 24).isActive = true
        logInButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        logInButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
