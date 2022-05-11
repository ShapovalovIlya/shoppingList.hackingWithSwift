//
//  ShoppingListModel.swift
//  shoppingList.hackingWithSwift
//
//  Created by Илья Шаповалов on 10.05.2022.
//

import Foundation

struct ShoppingListModel {
    
    var shoppingList = [
        "Bred",
        "Icecream",
        "eggs"
    ]
    
    mutating func submitProduct(_ product: String) {
        shoppingList.insert(product, at: 0)
    }
    
    func getList() -> String {
        shoppingList.joined(separator: "\n")
    }
}
