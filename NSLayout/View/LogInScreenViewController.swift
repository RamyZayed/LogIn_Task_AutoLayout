//
//  ViewController.swift
//  NSLayout
//
//  Created by Mobile Team on 14/02/2022.
//

import UIKit

class LogInScreenViewController: UIViewController {
    
    let layoutTable : UITableView = {
        let mytable = UITableView()
        mytable.register( imageCell.self, forCellReuseIdentifier: "layoutCell")
        mytable.register( CredentialsCell.self, forCellReuseIdentifier: "layoutCell2")
        mytable.register(AlternativeLogInOptionsCell.self , forCellReuseIdentifier: "layoutCell3")
        mytable.register(RegisterCell.self , forCellReuseIdentifier: "layoutCell4")
        
        return mytable
    }()
    

    let viewModel = LogInViewModel()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutTable.delegate = self
        layoutTable.dataSource = self
        layoutTable.rowHeight = UITableView.automaticDimension
        layoutTable.separatorStyle = .none
        addingViews()
    }
    func addingViews() {
        view.addSubview(layoutTable)
        layoutTable.translatesAutoresizingMaskIntoConstraints = false
        layoutTable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        layoutTable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        layoutTable.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        layoutTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    }
}

extension LogInScreenViewController : UITableViewDelegate {

}

extension LogInScreenViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            return layoutTable.dequeueReusableCell(withIdentifier: "layoutCell", for: indexPath) as! imageCell
        }else if(indexPath.row == 1){
            let cell = layoutTable.dequeueReusableCell(withIdentifier: "layoutCell2", for: indexPath) as! CredentialsCell
            cell.handler = { [weak self] in
                let tabBarVc = TabBarViewViewController()
                self?.present(tabBarVc, animated: true)
            }
            return cell
        }else if(indexPath.row == 2){
            return layoutTable.dequeueReusableCell(withIdentifier: "layoutCell3", for: indexPath) as! AlternativeLogInOptionsCell
        }else {
            return layoutTable.dequeueReusableCell(withIdentifier: "layoutCell4", for: indexPath) as! RegisterCell
        }
    }
    
    
    
    
    
}
