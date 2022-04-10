//
//  ViewController.swift
//  NSLayout
//
//  Created by Mobile Team on 14/02/2022.
//

import UIKit


class ViewController: UIViewController {
    
    let PasswordTextField = TextFieldWithPadding()
    let EmailTextField = TextFieldWithPadding()
    let upperImage = UIImageView()
    let LoginLabel = UILabel()
    let lockImage = UIImageView()
    let forgetButton = UIButton()
    let button =  UIButton()
    let orLabel = UILabel()
    let image = UIImageView()
    let image2 = UIImageView()
    let image3 = UIImageView()
    let newLabel = UILabel()
    let RegisterButton = UIButton()
    
    let upperView = UIView()
    let middleView = UIView()
    let CredView = UIView()
    let bottomView = UIView()

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        overrideUserInterfaceStyle = .dark
        setUpUpperImage()
        setUpMiddle()
        setUpCred()
        setUpBottom()

        
        
       
        //--------------------------------------------------------------------
        
        
    }
    
    
    func setUpUpperImage(){
        
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
    
    func setUpMiddle(){
        
        view.addSubview(middleView)
        middleView.translatesAutoresizingMaskIntoConstraints = false
        middleView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        middleView.topAnchor.constraint(equalTo: upperView.bottomAnchor).isActive = true
        middleView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        middleView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        
        
        
        LoginLabel.translatesAutoresizingMaskIntoConstraints = false
        LoginLabel.text = "Login"
        
        LoginLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        //LoginLabel.font = .boldSystemFont(ofSize: 35)
        LoginLabel.adjustsFontForContentSizeCategory = true
        LoginLabel.textColor = .black
        middleView.addSubview(LoginLabel)

        
       
    }
    func setUpCred (){
        
        view.addSubview(CredView)
        CredView.translatesAutoresizingMaskIntoConstraints = false
//        CredView.backgroundColor = .red
        CredView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        CredView.topAnchor.constraint(equalTo: middleView.bottomAnchor).isActive = true
        CredView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        CredView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant:   0 ) .isActive = true
        
        
        EmailTextField.leftViewMode = .always
        let atImage = UIImageView(frame: CGRect(x: 60, y: 0, width: 30, height: 30))
        atImage.image = UIImage(systemName: "at.circle")
        atImage.tintColor = .gray
        atImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        atImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        EmailTextField.leftView = atImage
        
        
        CredView.addSubview(EmailTextField)
        EmailTextField.translatesAutoresizingMaskIntoConstraints = false
        EmailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.boldSystemFont(ofSize: 15.0)
        ])
        
        
        
        EmailTextField.topAnchor.constraint(equalTo: CredView.topAnchor).isActive = true
        EmailTextField.leadingAnchor.constraint(equalTo: LoginLabel.leadingAnchor).isActive = true
        //EmailTextField.trailingAnchor.constraint(equalTo: CredView.trailingAnchor ).isActive = true
        //EmailTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        EmailTextField.heightAnchor.constraint(equalTo: CredView.heightAnchor , multiplier: 0.2).isActive = true
        EmailTextField.widthAnchor.constraint(equalTo: CredView.widthAnchor,multiplier: 0.8).isActive = true
        
        
        
        
        lockImage.image = UIImage(systemName: "lock" )
        lockImage.tintColor = .gray
        
        PasswordTextField.leftViewMode = .always
        PasswordTextField.leftView = lockImage
        PasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        PasswordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.boldSystemFont(ofSize: 15.0)
        ])
        PasswordTextField.isSecureTextEntry = true
        middleView.addSubview(PasswordTextField)
        
        PasswordTextField.topAnchor.constraint(equalTo: EmailTextField.bottomAnchor, constant: 20).isActive = true
        PasswordTextField.leadingAnchor.constraint(equalTo: EmailTextField.leadingAnchor).isActive = true
        PasswordTextField.trailingAnchor.constraint(equalTo: EmailTextField.trailingAnchor).isActive = true
        PasswordTextField.heightAnchor.constraint(equalTo: CredView.heightAnchor , multiplier: 0.2).isActive = true
        
        
        forgetButton.setTitle("Forgot?", for: .normal)
        
        forgetButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
    
        forgetButton.setTitleColor( UIColor(red: 0/255, green: 125/255, blue: 255/255, alpha: 1) , for: .normal)
        forgetButton.translatesAutoresizingMaskIntoConstraints = false
        PasswordTextField.rightView = forgetButton
        PasswordTextField.rightViewMode = .always
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.setTitle("Login", for: .normal)
        button.backgroundColor  = .systemBlue
        CredView.addSubview(button)
        button.topAnchor.constraint(equalTo: PasswordTextField.bottomAnchor , constant: 20).isActive = true
        button.heightAnchor.constraint(equalTo: CredView.heightAnchor, multiplier: 0.2).isActive = true
        button.leadingAnchor.constraint(equalTo: PasswordTextField.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: PasswordTextField.trailingAnchor).isActive = true
        
        
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        orLabel.text = "or log in with.."
        orLabel.textColor = .gray
        orLabel.font = .systemFont(ofSize: 15)
        CredView.addSubview(orLabel)

        orLabel.topAnchor.constraint(equalTo : button.bottomAnchor , constant: 15).isActive = true
        orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setUpBottom(){
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
//        bottomView.backgroundColor = .red
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        bottomView.topAnchor.constraint(equalTo: CredView.bottomAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant:   0 ) .isActive = true
        
        
        image.image = UIImage(named : "facebook")

        image.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        
        image.layer.shadowOffset = CGSize(width: 6, height: 6)
        image.layer.shadowOpacity = 1
        image.layer.shadowRadius = 2.0
        image.layer.masksToBounds = false
        
        let facebookButton = UIButton()
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
        facebookButton.topAnchor.constraint(equalToSystemSpacingBelow: bottomView.topAnchor, multiplier: 0.2).isActive = true
        //facebookButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        facebookButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        
        image2.image = UIImage(named : "twitter")
        let twitterButton = UIButton()
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
        twitterButton.trailingAnchor.constraint(equalTo: facebookButton.centerXAnchor,constant: -60).isActive = true
        twitterButton.topAnchor.constraint(equalTo: facebookButton.topAnchor).isActive = true
        
        
        
        
        let smallConfiguration = UIImage.SymbolConfiguration(scale: .large)
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .large)
        
        
        image3.image = UIImage(systemName: "applelogo", withConfiguration: largeConfig)
        let appleButton = UIButton()
        appleButton.layer.borderWidth = 1
        appleButton.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
        appleButton.layer.cornerRadius = 10
        
        //appleButton.contentVerticalAlignment = .fill
        //appleButton.contentHorizontalAlignment = .fill
        //appleButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        appleButton.translatesAutoresizingMaskIntoConstraints = false
        appleButton.setImage(image3.image, for: .normal)
        
        appleButton.tintColor =  UIColor(named: "mycolor")

        view.addSubview(appleButton)
        
        

        
        appleButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        appleButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        appleButton.trailingAnchor.constraint(equalTo: facebookButton.centerXAnchor,constant: 160).isActive = true
        appleButton.topAnchor.constraint(equalTo: facebookButton.topAnchor).isActive = true
        
        
        
        newLabel.text = "New to our App?"
        newLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newLabel)
        newLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -35).isActive = true
        
        
        
        
        RegisterButton.setTitle("Register", for: .normal)
        RegisterButton.translatesAutoresizingMaskIntoConstraints = false
        RegisterButton.backgroundColor = .clear
        RegisterButton.setTitleColor(UIColor.blue, for: .normal)
        
        view.addSubview(RegisterButton)
        RegisterButton.bottomAnchor.constraint(equalTo: newLabel.bottomAnchor,constant : 7).isActive = true
        RegisterButton.leadingAnchor.constraint(equalTo: newLabel.trailingAnchor).isActive = true
         
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        let middleViewWidth = middleView.frame.width
        let middleViewHeight = middleView.frame.height
        LoginLabel.leadingAnchor.constraint(equalTo: middleView.leadingAnchor ,constant: 0.1 * middleViewWidth).isActive  = true
        LoginLabel.topAnchor.constraint(equalTo: middleView.topAnchor).isActive = true
        LoginLabel.heightAnchor.constraint(equalToConstant: middleViewHeight ).isActive = true
        
        
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: PasswordTextField.frame.height , width: PasswordTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        PasswordTextField.borderStyle = UITextField.BorderStyle.none
        PasswordTextField.layer.addSublayer(bottomLine)
        
        let bottomLine1 = CALayer()
        bottomLine1.frame = CGRect(x: 0.0, y: EmailTextField.frame.height , width: EmailTextField.frame.width , height: 1.0)
        bottomLine1.backgroundColor = UIColor.gray.cgColor
        EmailTextField.borderStyle = UITextField.BorderStyle.none
        EmailTextField.layer.addSublayer(bottomLine1)
        
        
        
        let bottomViewHeight = bottomView.frame.height
        newLabel.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: 0.7 * bottomViewHeight).isActive = true
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
