//
//  MedicationView.swift
//  Migraine Tracker
//
//  Created by Filby, Vincent on 4/22/22.
//

import SwiftUI

struct MedicationHost: View {
    @Environment(\.editMode) var editMode
    
    var medication: Medication
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                MedicationSummary(medication: medication)
            } else {
                Text("Profile Editor")
            }
            
        }
    }
}

struct MedicationHost_Previews: PreviewProvider {
    
    static let context = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        
        let med = Medication(context: context)
        med.name = "Ubrelvy"
        med.dose = 100
        med.unit = "mg"
        
        return MedicationHost(medication: med)
    }
}
