//
//  MedicationsListView.swift
//  Migraine Tracker
//
//  Created by Filby, Vincent on 4/17/22.
//

import SwiftUI
import CoreData

struct MedicationsListView: View {
    @State var showAddMedication = false
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Medication.name, ascending: true)],
        animation: .default)
    private var medications: FetchedResults<Medication>
    
    var body: some View {
    
        List {
            ForEach(medications) { medication in
                NavigationLink {
                    MedicationHost(medication: medication)
                } label: {
                    MedicationListRow(medication: medication)
                }
            }
        }
        .navigationBarTitle("Medications")
        .navigationBarItems(
            trailing: HStack{
                Button( action: {self.showAddMedication.toggle()} ) {
                    Image(systemName: "plus")
                }
                    .sheet(isPresented: self.$showAddMedication) {
                        MedicationAddNew()
                    }
                EditButton()
            }
        )
    }
}

struct MedicationsListView_Previews: PreviewProvider {
    
    static var previews: some View {
        MedicationsListView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
