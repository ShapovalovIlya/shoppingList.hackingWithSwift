//
//  ViewController.swift
//  shoppingList.hackingWithSwift
//
//  Created by Илья Шаповалов on 10.05.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    let navigationBar = UINavigationBar()
    let tableView = UITableView()
    
    let shoppingListModel = ShoppingListModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(navigationBar)
        view.addSubview(tableView)
        
        //Create items for navigation bar
        navigationBar.prefersLargeTitles = true
        let navigationBarItems = UINavigationItem(title: "Shopping List")
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addShoppingItem))
        let chareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareList))
        navigationBarItems.leftBarButtonItem = addButton
        navigationBarItems.rightBarButtonItem = chareButton
        navigationBar.setItems([navigationBarItems], animated: false)
        
        //Set tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "shoppingCell")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        autolayoutNavigationBar()
        autolayoutTableView()
    }
    
    
    @objc func addShoppingItem() {
        
    }
    
    @objc func shareList() {
        
    }
    
    //MARK: - Autolayout for navigation bar
    func autolayoutNavigationBar() {
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        navigationBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    //MARK: - Autolayout for table view
    func autolayoutTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shoppingListModel.shoppingList.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = shoppingListModel.shoppingList[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
}



