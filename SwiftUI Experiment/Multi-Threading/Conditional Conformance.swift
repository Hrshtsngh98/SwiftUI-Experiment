//
//  Conditional Conformance.swift
//  SwiftUI Experiment
//
//  Created by Harshit on 1/24/26.
//

import Foundation

protocol Purchaseable {
    func buy()
}

class Item {
    var price: Int
    
    init(price: Int) {
        self.price = price
    }
}

class Book: Item, Purchaseable {
    func buy() {
        print("You bought a book: \(title)")
    }
    let title: String
    
    init(title: String, price: Int) {
        self.title = title
        super.init(price: price)
    }
}

extension Array: Purchaseable where Element: Purchaseable {
    func buy() {
        for item in self {
            item.buy()
        }
    }
}

class Toy: Item {
    let title: String
    
    init(title: String, price: Int) {
        self.title = title
        super.init(price: price)
    }
}

let arr = [Book(title: "as", price: 2), Toy(title: "", price: 4)]
let arr2 = [Book(title: "", price: 1)]

//for i in arr {
//    i
//}
//
//for i in arr2 {
//    i.buy()
//}
//
//arr2.buy()
