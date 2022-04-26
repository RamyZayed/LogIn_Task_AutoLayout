//
//  StringExtension.swift
//  NSLayout
//
//  Created by Mobile Team on 25/04/2022.
//

import Foundation




extension String {
    func firstLetterOfFirstAndLastName () -> String {
        let comp = components(separatedBy: " ")
        return "\(Array(comp[0])[0]) \(Array(comp [1])[0])"
    }
}
