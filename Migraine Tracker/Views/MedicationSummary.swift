//
//  MedicationSummary.swift
//  Migraine Tracker
//
//  Created by Filby, Vincent on 4/22/22.
//

import SwiftUI

struct MedicationSummary: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var medication: Medication
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Dosage:")
                    Text("fake")
                    Spacer()
                }
                if medication.image != nil {
                    let i = UIImage( data: medication.image! )!
                    Image( uiImage: i )
                        .scaledToFit()
                        .cornerRadius(30)
                        .shadow(radius: 30)
                }
            }
            .padding()
        }
        .navigationTitle(medication.name!)
        
            
    }
}

struct MedicationSummary_Previews: PreviewProvider {
    
    static let context = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        
        let med = Medication(context: context)
        med.name = "Ubrelvy"
        med.dose = 100
        med.unit = "mg"
        
        return MedicationSummary(medication: med)
    }
}
