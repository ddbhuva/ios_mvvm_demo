//
//  Signup+CoreDataProperties.swift
//  
//
//  Created by Kevin on 28/11/22.
//
//

import Foundation
import CoreData


extension Signup {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Signup> {
        return NSFetchRequest<Signup>(entityName: "Signup")
    }

    @NSManaged public var firstname: String?
    @NSManaged public var password: String?
    @NSManaged public var lastname: String?
    @NSManaged public var email: String?
    @NSManaged public var login: NSManagedObject?

}
