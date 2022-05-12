//
//  MedicationEditView.swift
//  Migraine Tracker
//
//  Created by Filby, Vincent on 4/22/22.
//

import SwiftUI
import CoreData

struct MedicationEditorConfig: Identifiable {
    let id = UUID()
    let context: NSManagedObjectContext
    let medication: Medication
    
    init(viewContext: NSManagedObjectContext, objectID: NSManagedObjectID!) {
        // create the scratch pad context
        context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.parent = viewContext
        
        // load the item into the scratch pad
        if( objectID != nil ) {
            medication = context.object(with: objectID) as! Medication
        } else {
            medication = Medication(context: context)
        }
    }
}




struct MedicationEditForm: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var medication: Medication
    let onSave: () -> Void
    @State var errorMessage: String?
    
    @State private var showImageSheet = false
    
    func isFormValid() -> Bool {
        return !medication.name!.isEmpty
    }
    
    var body: some View {
        Form {
            EntryField(sfSymbolName: "pills", placeHolder: "Medication name", prompt: "Medication name is required", field: $medication.name.toUnwrapped(defaultValue: "") )
//            TextField(medication.name ?? "Medication Name",
//                      text: $medication.name.toUnwrapped(defaultValue: ""))
//                .padding()
            
            VStack {
                Text("Dose: \(Int(medication.dose))")
                Slider(value: $medication.dose, in: 0...1000, step: 1)
            }
            .padding()
            
            VStack {
                let i = medication.image ?? UIImage(imageLiteralResourceName: "noimage.jpg" )
                Image( uiImage: i )
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 30)
                    .cornerRadius(20)
                    .onTapGesture {
                        showImageSheet = true
                    }
                    .sheet(isPresented: $showImageSheet) {
                        ImagePicker(sourceType: .photoLibrary, selectedImage: $medication.image.toUnwrapped(defaultValue: UIImage()))
                    }
            }
            HStack {
                Spacer()
                Button(
                    action: {
                        do {
                            try viewContext.save()
                            errorMessage = nil
                            onSave()
                        } catch {
                            let nsError = error as NSError
                            errorMessage  = "Unresolved error \(nsError), \(nsError.userInfo)"
                        }
                        dismiss()
                    }) {
                        Text("Save Medication")
                            .foregroundColor(.white)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                            .background(Capsule().fill(Color.blue))
                    }
                .opacity(isFormValid() ? 1 : 0.6)
                .disabled(!isFormValid())
                Spacer()
            }
        }
    }
}

struct MedicationEditForm_Previews: PreviewProvider {
    
    static let context = PersistenceController.preview.container.viewContext
    
    static var previews: some View {
        
        let med = Medication(context: context)
        med.name = "Ubrelvy"
        med.dose = 100
        med.unit = "mg"
        
        return MedicationEditForm( medication: med ) {
        }
    }
}
