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
    private var nameLabel : UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .monospacedDigitSystemFont(ofSize: 25, weight: .bold)
        nameLabel.textColor = .gray
        return nameLabel
    }()
    
    private var pic = UIImageView()
    private var jobLabel : UILabel = {
        let jobLabel = UILabel()
        jobLabel.font = .systemFont(ofSize: 13, weight: .bold)
        jobLabel.textColor = .lightGray
        return jobLabel
    }()
    
    private var phoneImage : UIImageView = {
        let phoneImage = UIImageView()
        phoneImage.image = UIImage(systemName: "phone.fill")
        phoneImage.tintColor = .darkGray
        phoneImage.backgroundColor = UIColor(cgColor: CGColor(red: 243/255, green: 197/255, blue: 255/255, alpha: 1))
        // phoneImage.layer.borderWidth = 1
        phoneImage.layer.cornerRadius = 15
        phoneImage.contentMode = .center
        return phoneImage
    }()
    
    private var smartphoneImage : UIImageView = {
        let smartphoneImage = UIImageView()
        smartphoneImage.image = UIImage(systemName: "iphone.homebutton")
        smartphoneImage.tintColor = .darkGray
        smartphoneImage.backgroundColor = UIColor(
            cgColor: CGColor(
                red: 243/255, green: 197/255, blue: 255/255, alpha: 1))
        smartphoneImage.layer.cornerRadius = 15
        smartphoneImage.contentMode = .center
        return smartphoneImage
    }()
    private var mailImage : UIImageView = {
        let mailImage = UIImageView()
        mailImage.image = UIImage(systemName: "envelope.fill")
        mailImage.backgroundColor = UIColor(cgColor: CGColor(red: 243/255, green: 197/255, blue: 255/255, alpha: 1))
        mailImage.tintColor = .darkGray
        mailImage.layer.cornerRadius = 15
        mailImage.contentMode = .center
        return mailImage
    }()
    
    private var infoLabel : UILabel = {
        let infoLabel = UILabel()
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        infoLabel.text = "Basic Information"
        infoLabel.font = .systemFont(ofSize: 17.6, weight: .heavy)
        infoLabel.textColor = .darkGray
        return infoLabel
    }()
    
    private var designationLabel : UILabel = {
        let designationLabel = UILabel()
        designationLabel.text = "Designation"
        designationLabel.textColor = .gray
        designationLabel.font = .systemFont(ofSize: 15, weight: .bold)
        designationLabel.translatesAutoresizingMaskIntoConstraints = false
        return designationLabel
    }()
    
    private var departmentLabel : UILabel = {
        let departmentLabel = UILabel()
        departmentLabel.text = "Department"
        departmentLabel.textColor = .gray
        departmentLabel.font = .systemFont(ofSize: 15, weight: .bold)
        departmentLabel.translatesAutoresizingMaskIntoConstraints = false
        return departmentLabel
    }()
    
    private var stationLabel : UILabel = {
        let stationLabel = UILabel()
        stationLabel.text = "Station"
        stationLabel.textColor = .gray
        stationLabel.font = .systemFont(ofSize: 15, weight: .bold)
        stationLabel.translatesAutoresizingMaskIntoConstraints = false
        return stationLabel
    }()
    
    private var companyLabel : UILabel  = {
        let companyLabel = UILabel()
        companyLabel.text = "Company"
        companyLabel.textColor = .gray
        companyLabel.font = .systemFont(ofSize: 15, weight: .bold)
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        return companyLabel
    }()
    
    private var designation : UILabel = {
        let designation = UILabel()
        designation.textColor = .gray
        designation.font = .systemFont(ofSize: 15, weight: .light)
        return designation
    }()
    private var department : UILabel = {
        let department = UILabel()
        department.textColor = .gray
        department.font = .systemFont(ofSize: 15, weight: .light)
        return department
    }()
    
    private var station : UILabel = {
        let station = UILabel()
        station.textColor = .gray
        station.font = .systemFont(ofSize: 15, weight: .light)
        return station
    }()
    private var company : UILabel = {
        let company = UILabel()
        company.textColor = .gray
        company.font = .systemFont(ofSize: 15, weight: .light)
        return company
    }()
    private var firstLetterOfFirstAndLast = UILabel()
    private var pictureHolder = UIView()
    private var labelView = UIView()
    private var threeButtonsView = UIView()
    private let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        return stackView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "ModeColor")
        addingViews()
        definningConstraints()
        
    }
    
    deinit {
        print("Deleted from memory")
    }
    
    func addingViews() {
        view.addSubview(pictureHolder)
        pictureHolder.addSubview(pic)
        view.addSubview(firstLetterOfFirstAndLast)
        view.addSubview(labelView)
        labelView.addSubview(nameLabel)
        view.addSubview(jobLabel)
        view.addSubview(threeButtonsView)
        threeButtonsView.addSubview(smartphoneImage)
        threeButtonsView.addSubview(phoneImage)
        threeButtonsView.addSubview(mailImage)
        view.addSubview(stackView)
        view.addSubview(designation)
        stackView.addSubview(department)
        stackView.addSubview(station)
        stackView.addSubview(company)
        stackView.addArrangedSubview(infoLabel)
        stackView.addArrangedSubview(designationLabel)
        stackView.addArrangedSubview(departmentLabel)
        stackView.addArrangedSubview(stationLabel)
        stackView.addArrangedSubview(companyLabel)
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
    
    func definningConstraints () {
        pictureHolder.translatesAutoresizingMaskIntoConstraints = false
        
        pictureHolder.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        pictureHolder.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        pictureHolder.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pictureHolder.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
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
            firstLetterOfFirstAndLast.translatesAutoresizingMaskIntoConstraints = false
            firstLetterOfFirstAndLast.centerXAnchor.constraint(equalTo: pic.centerXAnchor).isActive = true
            firstLetterOfFirstAndLast.centerYAnchor.constraint(equalTo: pic.centerYAnchor).isActive = true
            let comp = person!.name.components(separatedBy: " ")
            firstLetterOfFirstAndLast.text = "\(Array(comp[0])[0]) \(Array(comp[1])[0])"
            
        }
        
        labelView.translatesAutoresizingMaskIntoConstraints = false
        
        labelView.topAnchor.constraint(equalTo: pictureHolder.bottomAnchor).isActive = true
        labelView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        labelView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        labelView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: labelView.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: labelView.centerYAnchor).isActive = true
        nameLabel.text = person?.name
        
        
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
        threeButtonsView.translatesAutoresizingMaskIntoConstraints = false
        
        threeButtonsView.topAnchor.constraint(equalTo: labelView.bottomAnchor).isActive = true
        threeButtonsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.10).isActive = true
        threeButtonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        threeButtonsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        
        smartphoneImage.translatesAutoresizingMaskIntoConstraints = false
        smartphoneImage.centerYAnchor.constraint(equalTo: threeButtonsView.centerYAnchor).isActive = true
        smartphoneImage.centerXAnchor.constraint(equalTo: threeButtonsView.centerXAnchor).isActive = true
        smartphoneImage.heightAnchor.constraint(equalTo: threeButtonsView.heightAnchor, multiplier: 0.8).isActive = true
        smartphoneImage.widthAnchor.constraint(equalTo: smartphoneImage.heightAnchor).isActive = true
        
        
        phoneImage.translatesAutoresizingMaskIntoConstraints = false
        phoneImage.centerYAnchor.constraint(equalTo: threeButtonsView.centerYAnchor).isActive = true
        phoneImage.trailingAnchor.constraint(equalTo: smartphoneImage.leadingAnchor, constant: -40).isActive = true
        phoneImage.heightAnchor.constraint(equalTo: smartphoneImage.heightAnchor).isActive = true
        phoneImage.widthAnchor.constraint(equalTo: phoneImage.heightAnchor).isActive = true
        
        
        mailImage.translatesAutoresizingMaskIntoConstraints = false
        mailImage.centerYAnchor.constraint(equalTo: threeButtonsView.centerYAnchor).isActive = true
        mailImage.leadingAnchor.constraint(equalTo: smartphoneImage.trailingAnchor, constant: 40).isActive = true
        mailImage.heightAnchor.constraint(equalTo: phoneImage.heightAnchor).isActive = true
        mailImage.widthAnchor.constraint(equalTo: phoneImage.widthAnchor).isActive = true
        
        
        
        stackView.translatesAutoresizingMaskIntoConstraints  = false
        stackView.topAnchor.constraint(equalTo: threeButtonsView.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        
        
        
        
        infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        
        
        
        
        
        designationLabel.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor, constant: 10).isActive = true

        designation.translatesAutoresizingMaskIntoConstraints = false
        designation.text = person!.designation        
        designation.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        designation.topAnchor.constraint(equalTo: designationLabel.topAnchor).isActive = true
        
        
        
        
        departmentLabel.leadingAnchor.constraint(equalTo: designationLabel.leadingAnchor).isActive = true
        
        department.translatesAutoresizingMaskIntoConstraints = false
        department.text = person!.department
        department.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        department.topAnchor.constraint(equalTo: departmentLabel.topAnchor).isActive = true
        
        
        
        stationLabel.leadingAnchor.constraint(equalTo: departmentLabel.leadingAnchor).isActive = true
        
        station.translatesAutoresizingMaskIntoConstraints = false
        station.text = person!.station
        station.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        station.topAnchor.constraint(equalTo: stationLabel.topAnchor).isActive = true
        
        
        
        companyLabel.leadingAnchor.constraint(equalTo: stationLabel.leadingAnchor).isActive = true
        
        company.translatesAutoresizingMaskIntoConstraints = false
        company.text = person!.company
        company.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        company.topAnchor.constraint(equalTo: companyLabel.topAnchor).isActive = true
        
    }
}
