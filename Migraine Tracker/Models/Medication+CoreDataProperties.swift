//
//  Medication+CoreDataProperties.swift
//  Migraine Tracker
//
//  Created by Filby, Vincent on 4/29/22.
//
//

import Foundation
import CoreData
import SwiftUI


extension Medication {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Medication> {
        return NSFetchRequest<Medication>(entityName: "Medication")
    }

    @NSManaged public var dose: Double
    @NSManaged public var image: UIImage?
    @NSManaged public var name: String?
    @NSManaged public var notes: String?
    @NSManaged public var unit: String?

}

extension Medication : Identifiable {

}
