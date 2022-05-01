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
                    Text(medication.format_dose())
                    Spacer()
                }
                
                
                

                GeometryReader { geo in
                    HStack {
                        Spacer()
                            let i = medication.image ?? UIImage(imageLiteralResourceName: "noimage.jpg" )
                        Image( uiImage: i )
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width * 0.8, height: 300 )
                            .cornerRadius(10)
                            .shadow(radius: 10)

                        Spacer()
                    }
                }
                
                    
            
            }
    
        }
        .navigationTitle(medication.name!)
        .padding()
        
            
    }
}

struct MedicationSummary_Previews: PreviewProvider {
    
    static let context = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        
        let med = Medication(context: context)
        med.name = "Ubrelvy"
        med.dose = 100
        med.unit = "mg"
        med.image = UIImage( imageLiteralResourceName: "product_advil.jpg" )
        
        return MedicationSummary(medication: med)
    }
}
