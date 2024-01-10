//
//  Favorite+CoreDataProperties.swift
//  Hogwarts
//
//  Created by Ali Mirzamani on 1/10/24.
//
//

import Foundation
import CoreData


extension Favorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorite> {
        return NSFetchRequest<Favorite>(entityName: "Favorite")
    }

    @NSManaged public var id: String?

}

extension Favorite : Identifiable {

}
