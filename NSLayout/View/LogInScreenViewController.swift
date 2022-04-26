//
//  ViewController.swift
//  NSLayout
//
//  Created by Mobile Team on 14/02/2022.
//

import UIKit

class LogInScreenViewController: UIViewController {
    
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
    let facebookImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "facebook")
        image.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        image.layer.shadowOffset = CGSize(width: 6, height: 6)
        image.layer.shadowOpacity = 1
        image.layer.shadowRadius = 2.0
        image.layer.masksToBounds = false
        return image
    }()
    let twitterImage : UIImageView = {
        let image2 = UIImageView()
        image2.image = UIImage(named: "twitter")
        return image2
    }()
    let appleImage : UIImageView = {
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
    let logoView = UIView()
    let labelView = UIView()
    let credintialsView = UIView()
    let bottomView = UIView()
    let alternativeSignInViews = UIView()
    let facebookButton : UIButton = {
        let facebookButton = UIButton()
        facebookButton.layer.borderWidth = 1
        facebookButton.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
        facebookButton.layer.cornerRadius = 10
        facebookButton.contentVerticalAlignment = .center
        facebookButton.contentHorizontalAlignment = .center
        facebookButton.contentMode = .center
        facebookButton.imageView?.contentMode = .scaleAspectFit

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
//        twitterButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        twitterButton.contentMode = .center
        twitterButton.imageView?.contentMode = .scaleAspectFit
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
    
    let emailTextFieldBaseLine : UIView = {
        let line = UIView()
        line.backgroundColor = .gray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    let passwordTextFieldBaseLine : UIView = {
        let line = UIView()
        line.backgroundColor = .gray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
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
        let tabBarVc = TabBarViewViewController()
        present(tabBarVc, animated: true)
    }
    func addingViews() {
        view.addSubview(logoView)
        logoView.addSubview(upperImage)
        view.addSubview(labelView)
        labelView.addSubview(loginLabel)
        view.addSubview(credintialsView)
        credintialsView.addSubview(logInButton)
        credintialsView.addSubview(orLabel)
        credintialsView.addSubview(emailTextField)
        credintialsView.addSubview(passwordTextField)
        view.addSubview(alternativeSignInViews)
        alternativeSignInViews.addSubview(appleButton)
        alternativeSignInViews.addSubview(facebookButton)
        alternativeSignInViews.addSubview(twitterButton)
        view.addSubview(bottomView)
        bottomView.addSubview(newLabel)
        bottomView.addSubview(registerButton)
        credintialsView.addSubview(emailTextFieldBaseLine)
        credintialsView.addSubview(passwordTextFieldBaseLine)
    }
    func setUpConstraints() {
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        logoView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        logoView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        logoView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        logoView.backgroundColor = .brown
        upperImage.translatesAutoresizingMaskIntoConstraints = false
        
        upperImage.centerXAnchor.constraint(equalTo: logoView.centerXAnchor).isActive = true
        upperImage.centerYAnchor.constraint(equalTo: logoView.centerYAnchor).isActive = true
        upperImage.heightAnchor.constraint(equalTo: logoView.heightAnchor, multiplier: 0.6).isActive = true
        upperImage.widthAnchor.constraint(equalTo: logoView.widthAnchor, multiplier: 0.5).isActive = true
        
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        labelView.topAnchor.constraint(equalTo: logoView.bottomAnchor).isActive = true
        labelView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        labelView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        

        
        
        credintialsView.translatesAutoresizingMaskIntoConstraints = false
//                credView.backgroundColor = .red
        credintialsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        credintialsView.topAnchor.constraint(equalTo: labelView.bottomAnchor).isActive = true
        credintialsView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        credintialsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 ) .isActive = true
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        logInButton.bottomAnchor.constraint(equalTo: credintialsView.bottomAnchor).isActive = true
        logInButton.heightAnchor.constraint(equalTo: credintialsView.heightAnchor, multiplier: 0.3).isActive = true
        logInButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        logInButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true

        
        emailTextField.topAnchor.constraint(equalTo: credintialsView.topAnchor).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: credintialsView.heightAnchor, multiplier: 0.2).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: credintialsView.widthAnchor, multiplier: 0.8).isActive = true
        
        emailTextFieldBaseLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        emailTextFieldBaseLine.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        emailTextFieldBaseLine.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        emailTextFieldBaseLine.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        
        passwordTextFieldBaseLine.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        passwordTextFieldBaseLine.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true
        passwordTextFieldBaseLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        passwordTextFieldBaseLine.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor).isActive = true
    
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor).isActive = true
        

        
        
        
        
        alternativeSignInViews.translatesAutoresizingMaskIntoConstraints = false
//        alternativeSignInViews.backgroundColor = .yellow
        alternativeSignInViews.topAnchor.constraint(equalTo: credintialsView.bottomAnchor).isActive = true
        alternativeSignInViews.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        alternativeSignInViews.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        alternativeSignInViews.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        
        orLabel.topAnchor.constraint(equalTo: alternativeSignInViews.topAnchor).isActive = true
        orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        facebookButton.setImage(facebookImage.image, for: .normal)
        facebookButton.heightAnchor.constraint(equalTo: alternativeSignInViews.heightAnchor, multiplier: 0.4).isActive = true
        facebookButton.widthAnchor.constraint(equalTo: facebookButton.heightAnchor, multiplier: 1.5).isActive = true
        facebookButton.centerYAnchor.constraint(equalTo: alternativeSignInViews.centerYAnchor).isActive = true

        facebookButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true


        twitterButton.setImage(twitterImage.image, for: .normal)

        twitterButton.widthAnchor.constraint(equalTo: facebookButton.widthAnchor).isActive = true
        twitterButton.heightAnchor.constraint(equalTo: facebookButton.heightAnchor).isActive = true
        twitterButton.leadingAnchor.constraint(equalTo: logInButton.leadingAnchor).isActive = true
        twitterButton.topAnchor.constraint(equalTo: facebookButton.topAnchor).isActive = true


        appleButton.setImage(appleImage.image, for: .normal)

        appleButton.widthAnchor.constraint(equalTo: facebookButton.widthAnchor).isActive = true
        appleButton.heightAnchor.constraint(equalTo: facebookButton.heightAnchor).isActive = true
        appleButton.trailingAnchor.constraint(equalTo: logInButton.trailingAnchor).isActive = true
        appleButton.topAnchor.constraint(equalTo: facebookButton.topAnchor).isActive = true

        bottomView.translatesAutoresizingMaskIntoConstraints = false
//        bottomView.backgroundColor = .red
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        bottomView.topAnchor.constraint(equalTo: alternativeSignInViews.bottomAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        newLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        newLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -35).isActive = true

        registerButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: newLabel.trailingAnchor).isActive = true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let middleViewWidth = labelView.frame.width
        let middleViewHeight = labelView.frame.height
        loginLabel.leadingAnchor.constraint(equalTo: labelView.leadingAnchor, constant: 0.1*middleViewWidth).isActive = true
        loginLabel.topAnchor.constraint(equalTo: labelView.topAnchor).isActive = true
        loginLabel.heightAnchor.constraint(equalToConstant: middleViewHeight ).isActive = true
        
        //let width = facebookButton.bounds.width
       // facebookButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
//        let bottomLine = CALayer()
//        bottomLine.frame = CGRect(x: 0.0,
//                                  y: passwordTextField.frame.height,
//                                  width: passwordTextField.frame.width,
//                                  height: 1.0)
//        bottomLine.backgroundColor = UIColor.gray.cgColor
//        passwordTextField.borderStyle = UITextField.BorderStyle.none
//        passwordTextField.layer.addSublayer(bottomLine)
//        let bottomLine1 = CALayer()
//        bottomLine1.frame = CGRect(x: 0.0,
//                                   y: emailTextField.frame.height,
//                                   width: emailTextField.frame.width,
//                                   height: 1.0)
//        bottomLine1.backgroundColor = UIColor.gray.cgColor
       // emailTextField.borderStyle = UITextField.BorderStyle.none
        //emailTextField.layer.addSublayer(bottomLine1)
        //let bottomViewHeight = bottomView.frame.height
        //emailTextField.editingRect(forBounds: emailTextField.bounds)
    }
    
}

