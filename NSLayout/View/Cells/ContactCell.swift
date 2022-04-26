//
//  myCell.swift
//  ContactStuff
//
//  Created by Mobile Team on 27/02/2022.
//

import UIKit

class ContactCell: UITableViewCell {

    //private var colors: [UIColor] = [.blue, .red, .systemPink, .yellow, .green, .orange, .darkGray, .brown]
//    let color : UIColor = colors[Int.random(in: 0..<colors.count)]
    var nameLabel = UILabel()
    var image = UIImageView()
    var descriptionLabel = UILabel()
    var currentRoleLabel = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(image)
        addSubview(currentRoleLabel)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: 70).isActive = true
        image.widthAnchor.constraint(equalTo: image.heightAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        image.clipsToBounds = true
        image.layer.cornerRadius = 35
        currentRoleLabel.translatesAutoresizingMaskIntoConstraints = false
        currentRoleLabel.centerYAnchor.constraint(equalTo: image.centerYAnchor).isActive = true
        currentRoleLabel.centerXAnchor.constraint(equalTo: image.centerXAnchor).isActive = true
        currentRoleLabel.textColor = .white
        currentRoleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 15 ).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        nameLabel.textColor = .gray
        nameLabel.font = .systemFont(ofSize: 15, weight: .heavy)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        descriptionLabel.textColor = .gray
        descriptionLabel.font = .systemFont(ofSize: 12, weight: .light)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func elementsSetup (currentContact: Contact) {
        nameLabel.text = currentContact.name
        if let img = currentContact.image {
            image.image = img
            currentRoleLabel.text = ""
        } else {
//            let comp = currentContact.name.components(separatedBy: " ")
            currentRoleLabel.text = currentContact.name.firstLetterOfFirstAndLastName()
//            let random = Int.random(in : 0..<colors.count)
//            image.backgroundColor = colors[random]
            image.backgroundColor = currentContact.color
            image.image = nil
        }
        if !currentContact.designation.isEmpty && !currentContact.company.isEmpty {
            descriptionLabel.text = "\(currentContact.designation) at \(currentContact.company)"
        } else {
            descriptionLabel.text = ""
        }
        
    }
}
