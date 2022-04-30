//
//  MedicationListRow.swift
//  Migraine Tracker
//
//  Created by Filby, Vincent on 4/17/22.
//

import SwiftUI

struct MedicationListRow: View {
    var medication: Medication
    
    var body: some View {

        
        HStack {
            Text(medication.name!)
//            Text(medication.formatDose())
//                .foregroundColor(.gray)
            
        }
    }
}

struct MedicationListRow_Previews: PreviewProvider {
    
    static let context = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        
        let med = Medication(context: context)
        med.name = "Ubrelvy"
        med.dose = 100
        med.unit = "mg"
        
        
        return MedicationListRow(medication: med)
    }
}
