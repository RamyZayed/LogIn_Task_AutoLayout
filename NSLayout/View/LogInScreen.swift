//
//  ViewController.swift
//  NSLayout
//
//  Created by Mobile Team on 14/02/2022.
//

import UIKit

class LogInScreen: UIViewController {
    let passwordTextField = TextFieldWithPadding()
    let emailTextField = TextFieldWithPadding()
    let upperImage = UIImageView()
    let loginLabel = UILabel()
    let lockImage = UIImageView()
    let forgetButton = UIButton()
    let logInButton =  UIButton()
    let orLabel = UILabel()
    let image = UIImageView()
    let image2 = UIImageView()
    let image3 = UIImageView()
    let newLabel = UILabel()
    let registerButton = UIButton()
    let upperView = UIView()
    let middleView = UIView()
    let credView = UIView()
    let bottomView = UIView()
    let facebookButton = UIButton()
    let twitterButton = UIButton()
    let appleButton = UIButton()
    let viewModel = LogInViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUpper()
        setUpMiddle()
        setUpCred()
        setUpBottom()
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
    func setUpUpper() {
        view.addSubview(upperView)
        upperView.translatesAutoresizingMaskIntoConstraints = false
        upperView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        upperView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        upperView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        upperView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        upperImage.image = UIImage(named: "account.png")
        upperImage.translatesAutoresizingMaskIntoConstraints = false
        upperView.addSubview(upperImage)
        upperImage.centerXAnchor.constraint(equalTo: upperView.centerXAnchor).isActive = true
        upperImage.centerYAnchor.constraint(equalTo: upperView.centerYAnchor).isActive = true
        upperImage.heightAnchor.constraint(equalTo: upperView.heightAnchor, multiplier: 0.6).isActive = true
        upperImage.widthAnchor.constraint(equalTo: upperView.widthAnchor, multiplier: 0.5).isActive = true
    }
    func setUpMiddle() {
        view.addSubview(middleView)
        middleView.translatesAutoresizingMaskIntoConstraints = false
        middleView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        middleView.topAnchor.constraint(equalTo: upperView.bottomAnchor).isActive = true
        middleView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        middleView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.text = "Login"
        loginLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        // LoginLabel.font = .boldSystemFont(ofSize: 35)
        loginLabel.adjustsFontForContentSizeCategory = true
        loginLabel.textColor = .black
        middleView.addSubview(loginLabel)
    }
    func setUpCred() {
        view.addSubview(credView)
        credView.translatesAutoresizingMaskIntoConstraints = false
        //        CredView.backgroundColor = .red
        credView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        credView.topAnchor.constraint(equalTo: middleView.bottomAnchor).isActive = true
        credView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        credView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 ) .isActive = true
        setupTextFields()
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.layer.cornerRadius = 10
        logInButton.setTitle("Login", for: .normal)
        logInButton.backgroundColor  = .systemBlue
        credView.addSubview(logInButton)
        logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        logInButton.heightAnchor.constraint(equalTo: credView.heightAnchor, multiplier: 0.2).isActive = true
        logInButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        logInButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        orLabel.text = "or log in with.."
        orLabel.textColor = .gray
        orLabel.font = .systemFont(ofSize: 15)
        credView.addSubview(orLabel)
        orLabel.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 15).isActive = true
        orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    func setUpBottom() {
        setupFirstButton()
        setupSeondButton()
        setupThirdButton()
        //        let smallConfiguration = UIImage.SymbolConfiguration(scale: .large)
        setUpRegisterPrompt()
    }
    func setupTextFields() {
        emailTextField.leftViewMode = .always
        let atImage = UIImageView(frame: CGRect(x: 60, y: 0, width: 30, height: 30))
        atImage.image = UIImage(systemName: "at.circle")
        atImage.tintColor = .gray
        atImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        atImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        emailTextField.leftView = atImage
        credView.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.boldSystemFont(ofSize: 15.0)
        ])
        emailTextField.topAnchor.constraint(equalTo: credView.topAnchor).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: credView.heightAnchor, multiplier: 0.2).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: credView.widthAnchor, multiplier: 0.8).isActive = true
        lockImage.image = UIImage(systemName: "lock" )
        lockImage.tintColor = .gray
        passwordTextField.leftViewMode = .always
        passwordTextField.leftView = lockImage
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.boldSystemFont(ofSize: 15.0)
        ])
        passwordTextField.isSecureTextEntry = true
        credView.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: credView.heightAnchor, multiplier: 0.2).isActive = true
        forgetButton.setTitle("Forgot?", for: .normal)
        forgetButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        forgetButton.setTitleColor( UIColor(red: 0/255, green: 125/255, blue: 255/255, alpha: 1), for: .normal)
        forgetButton.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.rightView = forgetButton
        passwordTextField.rightViewMode = .always
    }
    func setupFirstButton() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        //        bottomView.backgroundColor = .red
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        bottomView.topAnchor.constraint(equalTo: credView.bottomAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        image.image = UIImage(named: "facebook")
        image.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        image.layer.shadowOffset = CGSize(width: 6, height: 6)
        image.layer.shadowOpacity = 1
        image.layer.shadowRadius = 2.0
        image.layer.masksToBounds = false
        facebookButton.layer.borderWidth = 1
        facebookButton.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
        facebookButton.layer.cornerRadius = 10
        facebookButton.contentVerticalAlignment = .center
        facebookButton.contentHorizontalAlignment = .center
        facebookButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: 30, bottom: 5, right: 30)
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        facebookButton.setImage(image.image, for: .normal)
        bottomView.addSubview(facebookButton)
        facebookButton.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.25).isActive = true
        facebookButton.heightAnchor.constraint(equalTo: facebookButton.widthAnchor, multiplier: 0.5).isActive = true
        facebookButton.topAnchor.constraint(equalToSystemSpacingBelow: bottomView.topAnchor, multiplier: 0.2)
            .isActive = true
        facebookButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    func setupSeondButton() {
        image2.image = UIImage(named: "twitter")
        twitterButton.layer.borderWidth = 1
        twitterButton.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
        twitterButton.layer.cornerRadius = 10
        twitterButton.contentVerticalAlignment = .fill
        twitterButton.contentHorizontalAlignment = .fill
        twitterButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: 30, bottom: 5, right: 30)
        twitterButton.translatesAutoresizingMaskIntoConstraints = false
        twitterButton.setImage(image2.image, for: .normal)
        view.addSubview(twitterButton)
        twitterButton.widthAnchor.constraint(equalTo: facebookButton.widthAnchor).isActive = true
        twitterButton.heightAnchor.constraint(equalTo: facebookButton.heightAnchor).isActive = true
        twitterButton.leadingAnchor.constraint(equalTo: logInButton.leadingAnchor).isActive = true
        twitterButton.topAnchor.constraint(equalTo: facebookButton.topAnchor).isActive = true
    }
    func setupThirdButton() {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .large)
        image3.image = UIImage(systemName: "applelogo", withConfiguration: largeConfig)
        appleButton.layer.borderWidth = 1
        appleButton.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
        appleButton.layer.cornerRadius = 10
        appleButton.translatesAutoresizingMaskIntoConstraints = false
        appleButton.setImage(image3.image, for: .normal)
        appleButton.tintColor =  UIColor(named: "mycolor")
        view.addSubview(appleButton)
        appleButton.widthAnchor.constraint(equalTo: facebookButton.widthAnchor).isActive = true
        appleButton.heightAnchor.constraint(equalTo: facebookButton.heightAnchor).isActive = true
        appleButton.trailingAnchor.constraint(equalTo: logInButton.trailingAnchor).isActive = true
        appleButton.topAnchor.constraint(equalTo: facebookButton.topAnchor).isActive = true
    }
    func setUpRegisterPrompt() {
        newLabel.text = "New to our App?"
        newLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newLabel)
        newLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -35).isActive = true
        registerButton.setTitle("Register", for: .normal)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.backgroundColor = .clear
        registerButton.setTitleColor(UIColor.blue, for: .normal)
        view.addSubview(registerButton)
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
extension UIImage {
    func resizeImageTo(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resizedImage
    }
}

class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 0,
        left: 5,
        bottom: 0,
        right: 0
    )
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
