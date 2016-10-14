//
//  Product+CoreDataProperties.swift
//  CoreDataDemo-C
//
//  Created by Rui Geng on 2016-10-13.
//  Copyright © 2016 Rui Geng. All rights reserved.
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product");
    }

    @NSManaged public var name: String?
    @NSManaged public var price: NSDecimalNumber?

}
