//
//  MedicationsListView.swift
//  Migraine Tracker
//
//  Created by Filby, Vincent on 4/17/22.
//

import SwiftUI
import CoreData

struct MedicationsListView: View {
    @State var medicationEditorConfig: MedicationEditorConfig?
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Medication.name, ascending: true)],
        animation: .default
    ) var medications: FetchedResults<Medication>
    
    var body: some View {
    
        List {
            ForEach(medications) { medication in
                NavigationLink {
                    MedicationDetail(medication: medication)
                } label: {
                    MedicationListRow(medication: medication)
                }
            }
        }
        .navigationBarTitle("Medications")
        .navigationBarItems(
            trailing: HStack{
                Button( action: edit ){
                    Image(systemName: "plus")
                }
                .sheet( item: $medicationEditorConfig, onDismiss: didDismiss) { config in
                    MedicationEditForm( medication: config.medication ) {
                        do {
                            try viewContext.save()
                        } catch {
                            let nsError = error as NSError
                            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                        }
                        medicationEditorConfig = nil
                    }
                    .environment(\.managedObjectContext, config.context)
                }
                EditButton()
            }
        )
    }
    
    func edit() {
        medicationEditorConfig = MedicationEditorConfig(viewContext: viewContext, objectID: nil )
    }
    
    func didDismiss() {
    
    }
}

struct MedicationsListView_Previews: PreviewProvider {
    
    static var previews: some View {
        MedicationsListView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
