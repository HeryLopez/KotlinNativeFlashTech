//
//  ViewController.swift
//  KotlinIOS
//
//  Created by hlopez on 14/11/2019.
//  Copyright © 2019 hlopez. All rights reserved.
//

import UIKit
import SharedCode

class ViewController: UIViewController {
    
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    var itemsList = [""]

    override func loadView() {
        super.loadView()
        
        safeArea = view.layoutMarginsGuide
        setupTableView()
        setupLabel()
        
        HttpBinClient().runGet(callback: self)
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: safeArea.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: safeArea.rightAnchor).isActive = true
        //tableView.separatorColor = .white
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setupLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
        label.center = CGPoint(x: 200, y: 50)
        label.textAlignment = .center
        label.font = label.font.withSize(25)
        label.text = CommonKt.createApplicationScreenMessage()
        view.addSubview(label)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = itemsList[indexPath.row]
        return cell
    }
}

extension ViewController: IResponse {
    func onResult(item: NSMutableArray) {
        itemsList = item as! [String]
        tableView.reloadData()
    }
}
