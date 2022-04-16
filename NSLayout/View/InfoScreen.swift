//
//  InfoScreen.swift
//  ContactStuff
//
//  Created by Mobile Team on 27/02/2022.
//

import UIKit

class InfoScreen: UIViewController {
    private var colors: [UIColor] = [.blue, .red, .systemPink, .yellow, .green, .orange, .darkGray, .brown]
    var person: Contact?
    private var nameLabel = UILabel()
    private var pic = UIImageView()
    private var jobLabel = UILabel()
    private var phoneImage = UIImageView()
    private var smartphoneImage = UIImageView()
    private var mailImage = UIImageView()
    private var infoLabel = UILabel()
    private var designationLabel = UILabel()
    private var departmentLabel = UILabel()
    private var stationLabel = UILabel()
    private var companyLabel = UILabel()
    private var designation = UILabel()
    private var department = UILabel()
    private var station = UILabel()
    private var company = UILabel()
    private var firstLetterOfFirstAndLast = UILabel()
    private var pictureHolder = UIView()
    private var labelView = UIView()
    private var threeButtonsView = UIView()
    private let stackView = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "ModeColor")
        print(person!)
        imageSetup()
        nameLabelSetup()
        joblabelSetup()
        threeButtonsSetup()
        infoViewSetup()
    }
    deinit {
        print("Deleted from memory")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DispatchQueue.main.async { [weak self] in
            let imgwidth = self!.pic.bounds.width
            self?.firstLetterOfFirstAndLast.font = .systemFont(ofSize: imgwidth/2, weight: .bold)
            self?.pic.layer.cornerRadius = self!.pic.bounds.height/2
            self?.pic.clipsToBounds = true
        }
    }
    func imageSetup() {
        pictureHolder.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pictureHolder)
        pictureHolder.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        pictureHolder.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        pictureHolder.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pictureHolder.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pictureHolder.addSubview(pic)
        pic.translatesAutoresizingMaskIntoConstraints = false
        pic.centerXAnchor.constraint(equalTo: pictureHolder.centerXAnchor).isActive          = true
        pic.centerYAnchor.constraint(equalTo: pictureHolder.centerYAnchor).isActive     = true
        pic.heightAnchor.constraint(equalTo: pictureHolder.heightAnchor, multiplier: 1).isActive = true
        pic.widthAnchor.constraint(equalTo: pic.heightAnchor).isActive              = true
        if let image = person?.image {
            pic.image = image
        } else {
            let random = Int.random(in: 0..<colors.count)
            pic.backgroundColor = colors[random]
            view.addSubview(firstLetterOfFirstAndLast)
            firstLetterOfFirstAndLast.translatesAutoresizingMaskIntoConstraints = false
            firstLetterOfFirstAndLast.centerXAnchor.constraint(equalTo: pic.centerXAnchor).isActive = true
            firstLetterOfFirstAndLast.centerYAnchor.constraint(equalTo: pic.centerYAnchor).isActive = true
            let comp = person!.name.components(separatedBy: " ")
            firstLetterOfFirstAndLast.text = "\(Array(comp[0])[0]) \(Array(comp[1])[0])"
        }
    }
    func nameLabelSetup() {
        labelView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelView)
//        labelView.backgroundColor = .red
        labelView.topAnchor.constraint(equalTo: pictureHolder.bottomAnchor).isActive = true
        labelView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        labelView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        labelView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        labelView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: labelView.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: labelView.centerYAnchor).isActive = true
        nameLabel.text = person?.name
        nameLabel.font = .monospacedDigitSystemFont(ofSize: 25, weight: .bold)
        nameLabel.textColor = .gray
    }
    func joblabelSetup() {
        view.addSubview(jobLabel)
        jobLabel.translatesAutoresizingMaskIntoConstraints = false
        jobLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        jobLabel.bottomAnchor.constraint(equalTo: labelView.bottomAnchor).isActive = true
        if let designation = person?.designation {
            if(!designation.isEmpty) {
                jobLabel.text = designation
            }
        }
        if let company = person?.company {
            if let text = jobLabel.text{
                jobLabel.text = text
            }
            if(!company.isEmpty) {
                jobLabel.text = "at \(company)"
            }
        }
//        jobLabel.text = "\(person!.designation) at \(person!.company)"
        jobLabel.font = .systemFont(ofSize: 13, weight: .bold)
        jobLabel.textColor = .lightGray
    }
    func threeButtonsSetup() {
        threeButtonsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(threeButtonsView)
        threeButtonsView.topAnchor.constraint(equalTo: labelView.bottomAnchor).isActive = true
        threeButtonsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.10).isActive = true
        threeButtonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        threeButtonsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        threeButtonsView.backgroundColor = .green
        smartphoneImageSetup()
        phoneImageSetup()
        mailImagesetUp()
    }
    func smartphoneImageSetup() {
        smartphoneImage.image = UIImage(systemName: "iphone.homebutton")
        smartphoneImage.tintColor = .darkGray
        smartphoneImage.backgroundColor = UIColor(
            cgColor: CGColor(
                red: 243/255, green: 197/255, blue: 255/255, alpha: 1))
        smartphoneImage.layer.cornerRadius = 15
        smartphoneImage.contentMode = .center
        threeButtonsView.addSubview(smartphoneImage)
        smartphoneImage.translatesAutoresizingMaskIntoConstraints = false
        smartphoneImage.centerYAnchor.constraint(equalTo: threeButtonsView.centerYAnchor).isActive = true
        smartphoneImage.centerXAnchor.constraint(equalTo: threeButtonsView.centerXAnchor).isActive = true
        smartphoneImage.heightAnchor.constraint(equalTo: threeButtonsView.heightAnchor, multiplier: 0.8).isActive = true
        smartphoneImage.widthAnchor.constraint(equalTo: smartphoneImage.heightAnchor).isActive = true
    }
    func phoneImageSetup() {
        phoneImage.image = UIImage(systemName: "phone.fill")
        phoneImage.tintColor = .darkGray
        phoneImage.backgroundColor = UIColor(cgColor: CGColor(red: 243/255, green: 197/255, blue: 255/255, alpha: 1))
        // phoneImage.layer.borderWidth = 1
        phoneImage.layer.cornerRadius = 15
        phoneImage.contentMode = .center
        threeButtonsView.addSubview(phoneImage)
        phoneImage.translatesAutoresizingMaskIntoConstraints = false
        phoneImage.centerYAnchor.constraint(equalTo: threeButtonsView.centerYAnchor).isActive = true
        phoneImage.trailingAnchor.constraint(equalTo: smartphoneImage.leadingAnchor, constant: -40).isActive = true
        phoneImage.heightAnchor.constraint(equalTo: smartphoneImage.heightAnchor).isActive = true
        phoneImage.widthAnchor.constraint(equalTo: phoneImage.heightAnchor).isActive = true
    }
    func mailImagesetUp() {
        mailImage.image = UIImage(systemName: "envelope.fill")
        mailImage.backgroundColor = UIColor(cgColor: CGColor(red: 243/255, green: 197/255, blue: 255/255, alpha: 1))
        mailImage.tintColor = .darkGray
        mailImage.layer.cornerRadius = 15
        mailImage.contentMode = .center
        threeButtonsView.addSubview(mailImage)
        mailImage.translatesAutoresizingMaskIntoConstraints = false
        mailImage.centerYAnchor.constraint(equalTo: threeButtonsView.centerYAnchor).isActive = true
        mailImage.leadingAnchor.constraint(equalTo: smartphoneImage.trailingAnchor, constant: 40).isActive = true
        mailImage.heightAnchor.constraint(equalTo: phoneImage.heightAnchor).isActive = true
        mailImage.widthAnchor.constraint(equalTo: phoneImage.widthAnchor).isActive = true
    }
    func infoViewSetup() {
        stackView.axis = .vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints  = false
        stackView.topAnchor.constraint(equalTo: threeButtonsView.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        infolabelSetup()
        designationlabelSetup()
        departmentLabelSetup()
        stationlabelSetup()
        companylabelSetup()
    }
    func infolabelSetup() {
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(infoLabel)
        infoLabel.text = "Basic Information"
        infoLabel.font = .systemFont(ofSize: 17.6, weight: .heavy)
        infoLabel.textColor = .darkGray
        infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
    }
    
    func designationlabelSetup() {
        stackView.addArrangedSubview(designationLabel)
        designationLabel.setup1(first: "Designation")
        designationLabel.translatesAutoresizingMaskIntoConstraints = false
        designationLabel.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor, constant: 10).isActive = true
        view.addSubview(designation)
        designation.translatesAutoresizingMaskIntoConstraints = false
        designation.setup2(first: person!.designation)
        designation.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        designation.topAnchor.constraint(equalTo: designationLabel.topAnchor).isActive = true
    }
    func departmentLabelSetup() {
        stackView.addArrangedSubview(departmentLabel)
        departmentLabel.setup1(first: "Department")
        departmentLabel.translatesAutoresizingMaskIntoConstraints = false
        departmentLabel.leadingAnchor.constraint(equalTo: designationLabel.leadingAnchor).isActive = true
        stackView.addSubview(department)
        department.translatesAutoresizingMaskIntoConstraints = false
        department.setup2(first: person!.department)
        department.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        department.topAnchor.constraint(equalTo: departmentLabel.topAnchor).isActive = true
    }
    func stationlabelSetup() {
        stackView.addArrangedSubview(stationLabel)
        stationLabel.setup1(first: "Station")
        stationLabel.translatesAutoresizingMaskIntoConstraints = false
        stationLabel.leadingAnchor.constraint(equalTo: departmentLabel.leadingAnchor).isActive = true
        stackView.addSubview(station)
        station.translatesAutoresizingMaskIntoConstraints = false
        station.setup2(first: person!.station)
        station.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        station.topAnchor.constraint(equalTo: stationLabel.topAnchor).isActive = true
    }
    func companylabelSetup() {
        stackView.addArrangedSubview(companyLabel)
        companyLabel.setup1(first: "Company")
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        companyLabel.leadingAnchor.constraint(equalTo: stationLabel.leadingAnchor).isActive = true
        stackView.addSubview(company)
        company.translatesAutoresizingMaskIntoConstraints = false
        company.setup2(first: person!.company)
        company.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        company.topAnchor.constraint(equalTo: companyLabel.topAnchor).isActive = true
    }
}

extension UILabel {
    func setup1(first: String) {
        self.text = first
        self.textColor = .gray
        self.font = .systemFont(ofSize: 15, weight: .bold)
    }
    func setup2(first: String) {
        self.text = first
        self.textColor = .gray
        self.font = .systemFont(ofSize: 15, weight: .light)
    }
}
