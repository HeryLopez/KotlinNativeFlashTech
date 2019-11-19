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
    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.layoutMarginsGuide
        setupLabel()
        setupTableView()
        HttpBinClient().runGet(callback: self)
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: safeArea.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: safeArea.rightAnchor).isActive = true
        //tableView.separatorColor = .white
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setupLabel() {
        label = UILabel()
        label.textAlignment = .center
        label.font=UIFont.systemFont(ofSize: 22)
        label.text = CommonKt.createApplicationScreenMessage()

        self.view.addSubview(label)
        label.heightAnchor.constraint(equalToConstant: 100).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: safeArea.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: safeArea.rightAnchor).isActive = true
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
