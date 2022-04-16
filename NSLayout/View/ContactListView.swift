//
//  ConactListView.swift
//  NSLayout
//
//  Created by Mobile Team on 13/04/2022.
//

import UIKit

class ContactListView: UIViewController {
    let viewModel = ConatctListViewModel()
    let mytable  = UITableView()
    let searchText = UITextField()
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
        setupSearch()
        setupTable()
    }
}
extension ContactListView: UITableViewDataSource {
    // the section divider
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        if searchText.text != ""{
            label.text = String(Array(searchText.text!)[0])
            return label
        }
        if viewModel.d2array[section].count == 0 {
            return nil
        }
        let sectionLabel = UnicodeScalar(section + 65)
        let char = Character(sectionLabel!)
        label.text = String(char)
        label.textColor  = .gray
        return label
    }
    // number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        if searchText.text != ""{
            return 1
        }
        return viewModel.d2array.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchText.text != ""{
            return viewModel.filtered.count
        }
        if viewModel.d2array[section].count == 0 {
            return 0
        }
        return viewModel.d2array[section].count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if viewModel.d2array[section].count == 0 {
            return 0
        }
        return 20
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if viewModel.d2array[section].count == 0 {
            return 0
        }
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = mytable.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ContactCell {
            var element: Contact
            if !viewModel.filtered.isEmpty {
                element = viewModel.filtered[indexPath.row]
            } else {
                element = viewModel.d2array[indexPath.section][indexPath.row]
            }
            cell.set(currentContact: element)
            return cell
        }
        return UITableViewCell()
    }
}

extension ContactListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mytable.deselectRow(at: indexPath, animated: true)
        let informationView = InfoScreen()
        if searchText.text != ""{
            informationView.person = viewModel.filtered[indexPath.row]
        } else {
            informationView.person = viewModel.d2array[indexPath.section][indexPath.row]
        }
        //        s2.person = profiles[indexPath.row]
        informationView.modalPresentationStyle = .formSheet
        DispatchQueue.main.async { [weak self] in
            self?.present(informationView, animated: true, completion: nil)
        }
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if !viewModel.filtered.isEmpty {
            return []
        }
        return viewModel.titles
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

// for looks
extension ContactListView {
    func setupSearch() {
        searchText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchText)
        searchText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        searchText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2).isActive = true
        searchText.placeholder = "Search Contacts"
        let img = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        img.tintColor  = .gray
        searchText.rightViewMode = .always
        searchText.rightView = img
    }
    func setupTable() {
        mytable.dataSource = self
        mytable.delegate = self
        searchText.delegate  = self
        mytable.register( ContactCell.self, forCellReuseIdentifier: "Cell")
        mytable.sectionHeaderTopPadding = 0
        view.addSubview(mytable)
        mytable.translatesAutoresizingMaskIntoConstraints  = false
        mytable.sectionIndexColor = .gray
        mytable.separatorColor = .clear
        mytable.topAnchor.constraint(equalTo: searchText.bottomAnchor, constant: 10).isActive = true
        mytable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        mytable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mytable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
