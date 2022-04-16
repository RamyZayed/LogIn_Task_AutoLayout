//
//  EmptyView.swift
//  NSLayout
//
//  Created by Mobile Team on 15/04/2022.
//

import UIKit

class EmptyView: UIViewController {
    var color: UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color!
    }
}
