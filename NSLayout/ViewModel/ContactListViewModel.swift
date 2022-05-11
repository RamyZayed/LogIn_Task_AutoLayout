//
//  ContactListViewModel.swift
//  NSLayout
//
//  Created by Mobile Team on 13/04/2022.
//

import Foundation
import Contacts
import UIKit
class ConatctListViewModel {
    let sections: [String] = [
        "A",
        "B",
        "C",
        "D",
        "E",
        "F",
        "G",
        "H",
        "I",
        "J",
        "K",
        "L",
        "M",
        "N",
        "O",
        "P",
        "Q",
        "R",
        "S",
        "T",
        "U",
        "V",
        "W",
        "X",
        "Y",
        "Z"
    ]
    var filtered: [Contact] = []
    var sortedContactsOnSections: [[Contact]] = [
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        []
    ]
    var contacts = [String : [Contact]]()
    
    func filterText(_ searchText: String) {
        filtered.removeAll()
        if searchText == ""{
            return
        }
        DispatchQueue.global(qos: .background).async {
            let query = searchText
            for column in self.sortedContactsOnSections {
                for element in column {
                    if element.name.uppercased().starts(with: query.uppercased()) {
                        self.filtered.append(element)
                    }
                }
            }
        }
    }
    func fetchContacts (completionHandler: @escaping () -> Void ) {
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { granted, err  in
            if let err = err {
                print("failed to request aContactess", err)
                return
            }
            if granted {
                print("AContactess Granted ")
                let keys = [CNContactGivenNameKey,          // name
                            CNContactFamilyNameKey,
                            CNContactPhoneNumbersKey,       // phonenumber
                            CNContactImageDataKey,          // image
                            CNContactOrganizationNameKey,   // company
                            CNContactDepartmentNameKey,     // department
                            CNContactJobTitleKey           // job title
                            // CNContactkey
                ]  // what you want to aContactess
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                do {
                    try store.enumerateContacts(with: request) { contact, _ in
                        var imm: UIImage?
                        if let data = contact.imageData {
                            imm = UIImage(data: data)!
                        }
                        let name = "\(contact.givenName) \(contact.familyName)"
                        let phoneNumber = contact.phoneNumbers
                        let designation  = contact.jobTitle
                        let department = contact.departmentName
                        let station = "USA"
                        let company = contact.organizationName
                        let profile = Contact(name: name,
                                              phoneNUmber: phoneNumber.first?.value ?? CNPhoneNumber(stringValue: "1234"),
                                              image: imm,
                                              designation: designation,
                                              department: department,
                                              station: station,
                                              company: company,
                                              color: colors.randomElement().unsafelyUnwrapped)
                        let firstLetter: Character = Character(Array(name)[0].uppercased())
                        var asc: Int = Int(firstLetter.asciiValue!)
                        asc -= 65
                        self.sortedContactsOnSections[asc].append(profile)
                        completionHandler()
                    }
                } catch _ {
                    print("Failed")
                }
            } else {
                print("AContactess denied")
            }
        }
    }
}
