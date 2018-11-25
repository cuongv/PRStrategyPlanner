//
//  PowerRanger+CoreDataProperties.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/25/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//
//

import Foundation
import CoreData

extension PowerRanger {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<PowerRanger> {
        return NSFetchRequest<PowerRanger>(entityName: "PowerRanger")
    }
    @NSManaged public var color: String?
    @NSManaged public var x: Int16
    @NSManaged public var y: Int16
}
