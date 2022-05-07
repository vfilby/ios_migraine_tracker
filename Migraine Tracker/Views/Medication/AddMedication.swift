////
////  MedicationAddNew.swift
////  Migraine Tracker
////
////  Created by Filby, Vincent on 4/17/22.
////
//
//import SwiftUI
//import CoreData
//
//struct AddMedication: View {
//    
//    @Environment(\.managedObjectContext) private var viewContext
//    private lazy var childViewContext: NSManagedObjectContext = {
//        // Initialize Managed Object Context
//        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//
//        // Configure Managed Object Context
//        managedObjectContext.parent = self.viewContext
//
//        return managedObjectContext
//    }()
//    
//    var body: some View {
//        var _medication = Medication( context: childViewContext )
//        MedicationEditForm(medication: _medication )
//    }
//}
//
//struct AddMedication_Previews: PreviewProvider {
//    static var previews: some View {
//        AddMedication()
//    }
//}
