//
//  Medication+CoreDataClass.swift
//  Migraine Tracker
//
//  Created by Filby, Vincent on 4/29/22.
//
//

import Foundation
import CoreData

@objc(Medication)
public class Medication: NSManagedObject {
    func format_dose() -> String {
        return String( format: "%.0f units", dose )
    }

}
