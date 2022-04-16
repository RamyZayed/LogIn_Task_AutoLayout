//
//  logInScreenViewModel.swift
//  NSLayout
//
//  Created by Mobile Team on 13/04/2022.
//

import Foundation

class LogInViewModel {
    // for now it isnt called , *demo*
    func authenticate(userName: String, password: String) -> Bool {
        guard  userName.contains(".com") else {
            return false
        }
        return true
    }
}
