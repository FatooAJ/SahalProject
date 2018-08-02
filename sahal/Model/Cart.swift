//
//  Cart.swift
//  sahal
//
//  Created by Fatima Aljaber on 02/08/2018.
//  Copyright © 2018 wadimakkah. All rights reserved.
//

import Foundation

class Cart: NSObject {
    
    private var productsArray: [Items] = []
    
    static let sharedInstance = Cart()
    
    func addProduct(product: Items) {
        productsArray.append(product)
}
    func productAtIndexPath(indexPath: NSIndexPath) -> Items {
        return productsArray[indexPath.row]
    }
    

    func numberOfItemsInCart() -> Int {
        return productsArray.count
    }

    func totalPriceInCart() -> Float {
        var totalPrice: Float = 0
        for product in productsArray {
            totalPrice += (product.Price as NSString).floatValue
        }
        return totalPrice
    }
    
    func removeProduct(product: String) -> Bool {
        if let index = productsArray.index(where: {$0.ProductId == product}){
            productsArray.remove(at: index)
        
            return true
        }
        
        return false
    }

}

