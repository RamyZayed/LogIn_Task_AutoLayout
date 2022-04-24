//
//  ViewController.swift
//  NSLayout
//
//  Created by Mobile Team on 15/04/2022.
//

import UIKit

class TabBarViewViewController: UITabBarController {
    let contactList = ContactListViewController()
    let tempView1 : EmptyViewViewController = {
        let tempView1 = EmptyViewViewController()
        tempView1.color = .green
        return tempView1
    }()
    let tempView2 : EmptyViewViewController = {
        let tempView2 = EmptyViewViewController()
        tempView2.color = .yellow
        return tempView2
    }()
    let tempView3 : EmptyViewViewController = {
        let tempView3 = EmptyViewViewController()
        tempView3.color = .blue
        return tempView3
    }()
    let viewModel = TabBarViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBarItems()
        setupBar()
    }
    func setupBar() {
        modalPresentationStyle = .fullScreen
        tabBar.layer.borderColor = UIColor.black.cgColor
        let tabBarAppearance: UITabBarAppearance  = UITabBarAppearance()
        tabBarAppearance.backgroundColor = UIColor(named: "ModeColor")
        tabBar.scrollEdgeAppearance = tabBarAppearance
        tabBar.tintColor = .systemRed
    }
    func setUpBarItems() {
        setViewControllers([contactList, tempView1, tempView2, tempView3], animated: true)
        guard let items = tabBar.items else {
            return
        }
        for iteration in 0..<items.count {
            items[iteration].title = viewModel.titles[iteration]
            items[iteration].image = UIImage(systemName: viewModel.images[iteration])
        }
        
    }
}
