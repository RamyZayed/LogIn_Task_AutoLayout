//
//  ConactListView.swift
//  NSLayout
//
//  Created by Mobile Team on 13/04/2022.
//

import UIKit
import Contacts

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






extension ContactListViewController: UITableViewDataSource {
    // the section divider
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        if searchText.text != ""{
            label.text = String(Array(searchText.text!)[0])
            return label
        }
        if viewModel.sortedContactsOnSections[section].count == 0 {
            return nil
        }
        let sectionLabel = UnicodeScalar(section + 65)
        let char = Character(sectionLabel!)
        label.text = "   " + String(char)
        label.textColor  = .gray
        return label
    }
    // number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        if searchText.text != ""{
            return 1
        }
        return viewModel.sortedContactsOnSections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchText.text != ""{
            return viewModel.filtered.count
        }
        
        if viewModel.sortedContactsOnSections[section].count == 0 {
            return 0
        }
        return viewModel.sortedContactsOnSections[section].count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if viewModel.sortedContactsOnSections[section].count == 0 {
            return 0
        }
        return 20
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if viewModel.sortedContactsOnSections[section].count == 0 {
            return 0
        }
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = contactsTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ContactCell {
            var element: Contact
            if !viewModel.filtered.isEmpty {
                element = viewModel.filtered[indexPath.row]
            } else {
                element = viewModel.sortedContactsOnSections[indexPath.section][indexPath.row]
            }
            cell.elementsSetup(currentContact: element)
            return cell
        }
        return UITableViewCell()
    }
}

extension ContactListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        contactsTableView.deselectRow(at: indexPath, animated: true)
        let informationView = InfoScreenViewController()
        let InfoScreenvm = InfoScreenViewModel()
        informationView.viewModel = InfoScreenvm
        if searchText.text != ""{
            informationView.viewModel.person = viewModel.filtered[indexPath.row]
        } else {
            informationView.viewModel.person = viewModel.sortedContactsOnSections[indexPath.section][indexPath.row]
        }
        //        s2.person = profiles[indexPath.row]
        informationView.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async { [weak self] in
            self?.present(informationView, animated: true, completion: nil)
        }
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if !viewModel.filtered.isEmpty {
            return []
        }
        return viewModel.sections
    }
}
