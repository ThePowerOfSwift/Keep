//
//  ShoppingItem.swift
//  Keep
//
//  Created by Luna An on 1/19/17.
//  Copyright © 2017 Mimicatcodes. All rights reserved.
//

import Foundation
import RealmSwift

class ShoppingItem: Object {
    
    dynamic var name:String = EmptyString.none
    dynamic var quantity: String = "1"
    dynamic var isPurchased:Bool = false
    dynamic var list: ShoppingList? 

    convenience init(name: String, isPurchased: Bool) {
        self.init()
        self.name = name
        self.isPurchased = isPurchased
    }
}

class ShoppingList: Object {
    
    dynamic var title: String = EmptyString.none
    dynamic var isCreatedAt: Date = Date()
    dynamic var numOfItems: Int = 0
    dynamic var uniqueID: String = EmptyString.none
    let shoppingItems = LinkingObjects(fromType: ShoppingItem.self, property: "list")
    
    convenience init(title: String, isCreatedAt: Date) {
        self.init()
        self.title = title
        self.isCreatedAt = isCreatedAt
    }
}
