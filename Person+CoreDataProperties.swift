//
//  Person+CoreDataProperties.swift
//  HitList2
//
//  Created by Gregory Weiss on 8/25/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Person {

    @NSManaged var name: String?
    @NSManaged var theDate: NSTimeInterval
    @NSManaged var theImage: NSData?

}
