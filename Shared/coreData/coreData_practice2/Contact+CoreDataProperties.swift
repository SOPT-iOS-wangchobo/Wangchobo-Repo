//
//  Contact+CoreDataProperties.swift
//  coreData_practice2
//
//  Created by 송지훈 on 2020/08/23.
//  Copyright © 2020 송지훈. All rights reserved.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var shortCut: Int16

}
