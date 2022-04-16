//
//  myCell.swift
//  ContactStuff
//
//  Created by Mobile Team on 27/02/2022.
//

import UIKit

class ContactCell: UITableViewCell {

    private var colors: [UIColor] = [.blue, .red, .systemPink, .yellow, .green, .orange, .darkGray, .brown]
    var name = UILabel()
    var image = UIImageView()
    var desc = UILabel()
    var text = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(name)
        addSubview(desc)
        addSubview(image)
        addSubview(text)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: 70).isActive = true
        image.widthAnchor.constraint(equalTo: image.heightAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        image.clipsToBounds = true
        image.layer.cornerRadius = 35
        text.translatesAutoresizingMaskIntoConstraints = false
        text.centerYAnchor.constraint(equalTo: image.centerYAnchor).isActive = true
        text.centerXAnchor.constraint(equalTo: image.centerXAnchor).isActive = true
        text.textColor = .white
        text.font = .systemFont(ofSize: 20, weight: .bold)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 15 ).isActive = true
        name.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        name.textColor = .gray
        name.font = .systemFont(ofSize: 15, weight: .heavy)
        desc.translatesAutoresizingMaskIntoConstraints = false
        desc.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5).isActive = true
        desc.leadingAnchor.constraint(equalTo: name.leadingAnchor).isActive = true
        desc.textColor = .gray
        desc.font = .systemFont(ofSize: 12, weight: .light)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func set (currentContact: Contact) {
        name.text = currentContact.name
        if let img = currentContact.image {
            image.image = img
            text.text = ""
        } else {
            let comp = currentContact.name.components(separatedBy: " ")
            text.text = "\(Array(comp[0])[0]) \(Array(comp[1])[0])"
            let random = Int.random(in: 0..<colors.count)
            image.backgroundColor = colors[random]
            image.image = nil
        }
        if !currentContact.designation.isEmpty && !currentContact.company.isEmpty {
            desc.text = "\(currentContact.designation) at \(currentContact.company)"
        } else {
            desc.text = ""
        }
        
    }
}
