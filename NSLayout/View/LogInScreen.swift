//
//  ViewController.swift
//  NSLayout
//
//  Created by Mobile Team on 14/02/2022.
//

import UIKit

class LogInScreen: UIViewController {
    let passwordTextField : TextFieldWithPadding = {
        let passwordTextField = TextFieldWithPadding()
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.boldSystemFont(ofSize: 15.0)
        ])
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    let emailTextField : TextFieldWithPadding = {
       let emailTextField = TextFieldWithPadding()
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.boldSystemFont(ofSize: 15.0)
        ])
        
        return emailTextField
    }()
    let upperImage :UIImageView = {
        let upperImage = UIImageView()
        upperImage.image = UIImage(named: "account.png")
        return upperImage
    }()
    let loginLabel : UILabel = {
        let loginLabel = UILabel()
        loginLabel.text = "Login"
        loginLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        // LoginLabel.font = .boldSystemFont(ofSize: 35)
        loginLabel.adjustsFontForContentSizeCategory = true
        loginLabel.textColor = .black
        return loginLabel
    }()
    let lockImage : UIImageView = {
        let lockImage = UIImageView()
        lockImage.image = UIImage(systemName: "lock" )
        lockImage.tintColor = .gray
        return lockImage
    }()
    let forgetButton : UIButton = {
        let forgetButton = UIButton()
        forgetButton.setTitle("Forgot?", for: .normal)
        forgetButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        forgetButton.setTitleColor( UIColor(red: 0/255, green: 125/255, blue: 255/255, alpha: 1), for: .normal)
        return forgetButton
    }()
    let logInButton :  UIButton = {
        let logInButton = UIButton()
        logInButton.layer.cornerRadius = 10
        logInButton.setTitle("Login", for: .normal)
        logInButton.backgroundColor  = .systemBlue
        return logInButton
    }()
    let orLabel : UILabel = {
        let orLabel = UILabel()
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        orLabel.text = "or log in with.."
        orLabel.textColor = .gray
        orLabel.font = .systemFont(ofSize: 15)
        return orLabel
    }()
    let image : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "facebook")
        image.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        image.layer.shadowOffset = CGSize(width: 6, height: 6)
        image.layer.shadowOpacity = 1
        image.layer.shadowRadius = 2.0
        image.layer.masksToBounds = false
        return image
    }()
    let image2 : UIImageView = {
        let image2 = UIImageView()
        image2.image = UIImage(named: "twitter")
        return image2
    }()
    let image3 : UIImageView = {
        let image3 = UIImageView()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .large)
        image3.image = UIImage(systemName: "applelogo", withConfiguration: largeConfig)
        return image3
    }()
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
    let upperView = UIView()
    let middleView = UIView()
    let credView = UIView()
    let bottomView = UIView()
    let facebookButton : UIButton = {
        let facebookButton = UIButton()
        facebookButton.layer.borderWidth = 1
        facebookButton.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
        facebookButton.layer.cornerRadius = 10
        facebookButton.contentVerticalAlignment = .center
        facebookButton.contentHorizontalAlignment = .center
        facebookButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: 30, bottom: 5, right: 30)
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        return facebookButton
    }()
    let twitterButton : UIButton = {
        let twitterButton = UIButton()
        twitterButton.layer.borderWidth = 1
        twitterButton.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
        twitterButton.layer.cornerRadius = 10
        twitterButton.contentVerticalAlignment = .fill
        twitterButton.contentHorizontalAlignment = .fill
        twitterButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: 30, bottom: 5, right: 30)
        twitterButton.translatesAutoresizingMaskIntoConstraints = false
        return twitterButton
    }()
    let appleButton : UIButton = {
        let appleButton = UIButton()
        appleButton.layer.borderWidth = 1
        appleButton.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
        appleButton.layer.cornerRadius = 10
        appleButton.tintColor =  UIColor(named: "mycolor")
        appleButton.translatesAutoresizingMaskIntoConstraints = false
        return appleButton
    }()
    let viewModel = LogInViewModel()
    
    let atImage : UIImageView = {
        let atImage = UIImageView(frame: CGRect(x: 60, y: 0, width: 30, height: 30))
        atImage.image = UIImage(systemName: "at.circle")
        atImage.tintColor = .gray
        return atImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addingViews()
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
        let tabBarVc = TabBarView()
        present(tabBarVc, animated: true)
    }
    func addingViews() {
        view.addSubview(upperView)
        upperView.addSubview(upperImage)
        view.addSubview(middleView)
        middleView.addSubview(loginLabel)
        view.addSubview(credView)
        credView.addSubview(logInButton)
        credView.addSubview(orLabel)
        credView.addSubview(emailTextField)
        credView.addSubview(passwordTextField)
        view.addSubview(bottomView)
        bottomView.addSubview(facebookButton)
        bottomView.addSubview(twitterButton)
        bottomView.addSubview(newLabel)
        bottomView.addSubview(appleButton)
        bottomView.addSubview(registerButton)
    }
    func setUpConstraints() {
        upperView.translatesAutoresizingMaskIntoConstraints = false
        upperView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        upperView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        upperView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        upperView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        upperImage.translatesAutoresizingMaskIntoConstraints = false
        
        upperImage.centerXAnchor.constraint(equalTo: upperView.centerXAnchor).isActive = true
        upperImage.centerYAnchor.constraint(equalTo: upperView.centerYAnchor).isActive = true
        upperImage.heightAnchor.constraint(equalTo: upperView.heightAnchor, multiplier: 0.6).isActive = true
        upperImage.widthAnchor.constraint(equalTo: upperView.widthAnchor, multiplier: 0.5).isActive = true
        
        middleView.translatesAutoresizingMaskIntoConstraints = false
        middleView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        middleView.topAnchor.constraint(equalTo: upperView.bottomAnchor).isActive = true
        middleView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        middleView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        credView.translatesAutoresizingMaskIntoConstraints = false
        //        CredView.backgroundColor = .red
        credView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        credView.topAnchor.constraint(equalTo: middleView.bottomAnchor).isActive = true
        credView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        credView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 ) .isActive = true
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        logInButton.heightAnchor.constraint(equalTo: credView.heightAnchor, multiplier: 0.2).isActive = true
        logInButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        logInButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true
        
        
        orLabel.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 15).isActive = true
        orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        atImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        atImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        emailTextField.leftViewMode = .always
        emailTextField.leftView = atImage
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        emailTextField.topAnchor.constraint(equalTo: credView.topAnchor).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: credView.heightAnchor, multiplier: 0.2).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: credView.widthAnchor, multiplier: 0.8).isActive = true
        
        passwordTextField.leftViewMode = .always
        passwordTextField.leftView = lockImage
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: credView.heightAnchor, multiplier: 0.2).isActive = true
        
        forgetButton.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.rightView = forgetButton
        passwordTextField.rightViewMode = .always
        
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        //        bottomView.backgroundColor = .red
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        bottomView.topAnchor.constraint(equalTo: credView.bottomAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        
        facebookButton.setImage(image.image, for: .normal)
        facebookButton.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.25).isActive = true
        facebookButton.heightAnchor.constraint(equalTo: facebookButton.widthAnchor, multiplier: 0.5).isActive = true
        facebookButton.topAnchor.constraint(equalToSystemSpacingBelow: bottomView.topAnchor, multiplier: 0.2)
            .isActive = true
        facebookButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        twitterButton.setImage(image2.image, for: .normal)
        
        twitterButton.widthAnchor.constraint(equalTo: facebookButton.widthAnchor).isActive = true
        twitterButton.heightAnchor.constraint(equalTo: facebookButton.heightAnchor).isActive = true
        twitterButton.leadingAnchor.constraint(equalTo: logInButton.leadingAnchor).isActive = true
        twitterButton.topAnchor.constraint(equalTo: facebookButton.topAnchor).isActive = true
        
        
        appleButton.setImage(image3.image, for: .normal)
        
        appleButton.widthAnchor.constraint(equalTo: facebookButton.widthAnchor).isActive = true
        appleButton.heightAnchor.constraint(equalTo: facebookButton.heightAnchor).isActive = true
        appleButton.trailingAnchor.constraint(equalTo: logInButton.trailingAnchor).isActive = true
        appleButton.topAnchor.constraint(equalTo: facebookButton.topAnchor).isActive = true
        
        
        
        newLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -35).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: newLabel.bottomAnchor, constant: 7).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: newLabel.trailingAnchor).isActive = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let middleViewWidth = middleView.frame.width
        let middleViewHeight = middleView.frame.height
        loginLabel.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 0.1*middleViewWidth)
            .isActive  = true
        loginLabel.topAnchor.constraint(equalTo: middleView.topAnchor).isActive = true
        loginLabel.heightAnchor.constraint(equalToConstant: middleViewHeight ).isActive = true
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0,
                                  y: passwordTextField.frame.height,
                                  width: passwordTextField.frame.width,
                                  height: 1.0)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        passwordTextField.borderStyle = UITextField.BorderStyle.none
        passwordTextField.layer.addSublayer(bottomLine)
        let bottomLine1 = CALayer()
        bottomLine1.frame = CGRect(x: 0.0,
                                   y: emailTextField.frame.height,
                                   width: emailTextField.frame.width,
                                   height: 1.0)
        bottomLine1.backgroundColor = UIColor.gray.cgColor
        emailTextField.borderStyle = UITextField.BorderStyle.none
        emailTextField.layer.addSublayer(bottomLine1)
        let bottomViewHeight = bottomView.frame.height
        newLabel.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: 0.7*bottomViewHeight).isActive = true
        //        newLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
    }
}

