//
//  AlternativeLogInOptionsCell.swift
//  NSLayout
//
//  Created by Mobile Team on 11/05/2022.
//

import UIKit

class AlternativeLogInOptionsCell: UITableViewCell {

    let facebookImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "facebook")
        image.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        image.layer.shadowOffset = CGSize(width: 6, height: 6)
        image.layer.shadowOpacity = 1
        image.layer.shadowRadius = 2.0
        image.layer.masksToBounds = false
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let twitterImage : UIImageView = {
        let image2 = UIImageView()
        image2.image = UIImage(named: "twitter")
        image2.translatesAutoresizingMaskIntoConstraints = false
        return image2
    }()
    let appleImage : UIImageView = {
        let image3 = UIImageView()
        image3.translatesAutoresizingMaskIntoConstraints = false
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .large)
        image3.image = UIImage(systemName: "applelogo", withConfiguration: largeConfig)
        return image3
    }()
    
    let orLabel : UILabel = {
        let orLabel = UILabel()
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        orLabel.text = "or log in with.."
        orLabel.textColor = .gray
        orLabel.font = .systemFont(ofSize: 15)
        return orLabel
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
    
    let appleButton : UIButton = {
        let appleButton = UIButton()
        appleButton.layer.borderWidth = 1
        appleButton.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
        appleButton.layer.cornerRadius = 10
        appleButton.tintColor =  UIColor(named: "mycolor")
        appleButton.translatesAutoresizingMaskIntoConstraints = false
        return appleButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addViews()
        setUpConstraints()
        
    }
    
    func addViews(){
        contentView.addSubview(orLabel)
        contentView.addSubview(twitterButton)
        contentView.addSubview(facebookButton)
        contentView.addSubview(appleButton)
    }
    
    func setUpConstraints(){
        orLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 12).isActive = true
        orLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        twitterButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor,constant: 10).isActive = true
        twitterButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 12).isActive = true
        twitterButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        twitterButton.widthAnchor.constraint(equalTo: twitterButton.heightAnchor,multiplier: 1.5).isActive = true
        twitterButton.setImage(twitterImage.image, for: .normal)
        twitterButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        
        facebookButton.setImage(facebookImage.image, for: .normal)
        facebookButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        facebookButton.topAnchor.constraint(equalTo: twitterButton.topAnchor).isActive = true
        facebookButton.heightAnchor.constraint(equalTo: twitterButton.heightAnchor).isActive = true
        facebookButton.widthAnchor.constraint(equalTo: twitterButton.widthAnchor).isActive = true
        
        appleButton.setImage(appleImage.image, for: .normal)
        appleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -12).isActive = true
        appleButton.topAnchor.constraint(equalTo: twitterButton.topAnchor).isActive = true
        appleButton.heightAnchor.constraint(equalTo: twitterButton.heightAnchor).isActive = true
        appleButton.widthAnchor.constraint(equalTo: twitterButton.widthAnchor).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
