//
//  AppHome.swift
//  Migraine Tracker
//
//  Created by Filby, Vincent on 4/22/22.
//

import SwiftUI

struct AppHome: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    MedicationsListView()
                } label: {
                    Text("Medications")
                }
            }
        }
    }
}

struct AppHome_Previews: PreviewProvider {
    static var previews: some View {
        AppHome()
    }
}
