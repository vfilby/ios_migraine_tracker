//
//  MedicationAddNew.swift
//  Migraine Tracker
//
//  Created by Filby, Vincent on 4/17/22.
//

import SwiftUI

struct MedicationAddNew: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var dose: Double = 0
    @State private var picture: UIImage = UIImage( imageLiteralResourceName: "noimage.jpg")
    @State private var showImageSheet = false
    
    var body: some View {
        Form {
            TextField("Medication Name", text: $name)
                .padding()
            
            VStack {
                Text("Dose: \(Int(dose))")
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

struct MedicationAddNew_Previews: PreviewProvider {
    static var previews: some View {
        MedicationAddNew()
    }
}
