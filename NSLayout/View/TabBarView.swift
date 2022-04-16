//
//  ViewController.swift
//  NSLayout
//
//  Created by Mobile Team on 15/04/2022.
//

import UIKit

class TabBarView: UITabBarController {
    let contactList = ContactListView()
    let tempView1 = EmptyView()
    let tempView2 = EmptyView()
    let tempView3 = EmptyView()
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
        tempView1.color = .green
        tempView2.color = .yellow
        tempView3.color = .blue
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
