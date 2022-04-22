//
//  ConactListView.swift
//  NSLayout
//
//  Created by Mobile Team on 13/04/2022.
//

import UIKit

class ContactListView: UIViewController {
    let viewModel = ConatctListViewModel()
    let mytable  : UITableView = {
        let mytable = UITableView()
        mytable.register( ContactCell.self, forCellReuseIdentifier: "Cell")
        mytable.sectionHeaderTopPadding = 0
        mytable.sectionIndexColor = .gray
        mytable.separatorColor = .clear
        return mytable
    }()
    let searchText : UITextField = {
        let searchText = UITextField()
        searchText.placeholder = "Search Contacts"
        let img = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        img.tintColor  = .gray
        searchText.rightViewMode = .always
        searchText.rightView = img
        return searchText
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global(qos: .background).async {
            self.viewModel.fetchingContacts {
                DispatchQueue.main.async { [weak self] in
                    self!.mytable.reloadData()
                }
            }
        }
        view.backgroundColor = UIColor(named: "ModeColor")
        setupViews()
        setupConstraints()
    }
    func setupViews() {
        mytable.dataSource = self
        mytable.delegate = self
        searchText.delegate  = self
        view.addSubview(searchText)
        view.addSubview(mytable)
    }
    func setupConstraints() {
        searchText.translatesAutoresizingMaskIntoConstraints = false
        
        searchText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        searchText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2).isActive = true
        
        mytable.translatesAutoresizingMaskIntoConstraints  = false
        
        mytable.topAnchor.constraint(equalTo: searchText.bottomAnchor, constant: 10).isActive = true
        mytable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        mytable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mytable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension ContactListView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        viewModel.filterText(textField.text!)
        DispatchQueue.main.async {[weak self ] in
            self?.mytable.reloadData()
        }
    }
}
