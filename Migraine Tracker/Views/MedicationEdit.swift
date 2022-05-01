//
//  MedicationEditView.swift
//  Migraine Tracker
//
//  Created by Filby, Vincent on 4/22/22.
//

import SwiftUI

struct MedicationEdit: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    
    var medication: FetchedResults<Medication>.Element
    
    @State private var name = ""
    @State private var dose: Double = 0
    @State private var picture: UIImage = UIImage()
    @State private var showImageSheet = false
    
    var body: some View {
        Form {
            TextField(medication.name!, text: $name)
                .padding()
            
            VStack {
                Text("Dose: \(Int(medication.dose))")
                Slider(value: $dose, in: 0...1000, step: 5)
            }
            .padding()
            
            VStack {
                Image( uiImage: picture )
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 30)
                    .cornerRadius(20)
                    .onTapGesture {
                        showImageSheet = true
                    }
                    .sheet(isPresented: $showImageSheet) {
                        ImagePicker(sourceType: .photoLibrary, selectedImage: self.$picture)
                    }
            }
            HStack {
                Spacer()
                Button("Submit") {
                    let med = Medication(context: viewContext)
                    med.name = name
                    med.dose = dose
                    med.image = picture
                    
                    do {
                        try viewContext.save()
                    } catch {
                        // Replace this implementation with code to handle the error appropriately.
                        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                    dismiss()
                    
                }
                Spacer()
            }
        }
    }
}

struct MedicationEdit_Previews: PreviewProvider {
    
    static let context = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        
        let med = Medication(context: context)
        med.name = "Ubrelvy"
        med.dose = 100
        med.unit = "mg"
        
        return MedicationEdit( medication: med )
    }
}
