//
//  Contant+CoreDataProperties.swift
//  coreData_practice
//
//  Created by 송지훈 on 2020/08/23.
//  Copyright © 2020 송지훈. All rights reserved.
//
//

import Foundation
import CoreData


extension Contant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contant> {
        return NSFetchRequest<Contant>(entityName: "Contant")
    }

    @NSManaged public var shortcutNumber: Int16
    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?

}
