//
//  ContactListDelegates.swift
//  NSLayout
//
//  Created by Mobile Team on 22/04/2022.
//

import Foundation
import UIKit
extension ContactListViewController: UITableViewDataSource {
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

extension ContactListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mytable.deselectRow(at: indexPath, animated: true)
        let informationView = InfoScreenViewController()
        let InfoScreenvm = InfoScreenViewModel()
        informationView.viewModel = InfoScreenvm
        if searchText.text != ""{
            informationView.viewModel?.person = viewModel.filtered[indexPath.row]
        } else {
            informationView.viewModel?.person = viewModel.d2array[indexPath.section][indexPath.row]
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
