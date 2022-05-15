//
//  UITextFieldExtensions.swift
//  NSLayout
//
//  Created by Mobile Team on 20/04/2022.
//

import Foundation
import UIKit
class TextFieldWithBottomLine: UITextField {
    private var bottomBorder = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        borderStyle = .none

        self.translatesAutoresizingMaskIntoConstraints = false
        bottomBorder.translatesAutoresizingMaskIntoConstraints = false
        bottomBorder.backgroundColor = .gray
        
        self.addSubview(bottomBorder)
        bottomBorder.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bottomBorder.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bottomBorder.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bottomBorder.topAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
