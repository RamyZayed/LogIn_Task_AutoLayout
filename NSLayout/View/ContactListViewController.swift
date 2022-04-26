//
//  ConactListView.swift
//  NSLayout
//
//  Created by Mobile Team on 13/04/2022.
//

import UIKit

class ContactListViewController: UIViewController {
    let viewModel = ConatctListViewModel()
    let contactsTableView : UITableView = {
        let mytable = UITableView()
        mytable.register( ContactCell.self, forCellReuseIdentifier: "Cell")
        mytable.sectionHeaderTopPadding = 0
        mytable.sectionIndexColor = .gray
        mytable.separatorColor = .clear
        return mytable
    }()
    let searchText : UISearchBar = {
        let searchText = UISearchBar()
        searchText.placeholder = "Search Contacts"
        let img = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        img.tintColor  = .gray
//        searchText.rightViewMode = .always
//        searchText.rightView = img
        return searchText
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.fetchContacts {
            DispatchQueue.main.async { [weak self] in
                self?.contactsTableView.reloadData()
            }
        }
        view.backgroundColor = UIColor(named: "ModeColor")
        setupViews()
        setupConstraints()
    }
    func setupViews() {
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        searchText.delegate  = self
        view.addSubview(searchText)
        view.addSubview(contactsTableView)
    }
    func setupConstraints() {
        searchText.translatesAutoresizingMaskIntoConstraints = false
        
        searchText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        searchText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        searchText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        
        contactsTableView.translatesAutoresizingMaskIntoConstraints  = false
        
        contactsTableView.topAnchor.constraint(equalTo: searchText.bottomAnchor, constant: 10).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        contactsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        contactsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension ContactListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterText(searchBar.text!)
        DispatchQueue.main.async {[weak self ] in
            self?.contactsTableView.reloadData()
        }
    }
}
