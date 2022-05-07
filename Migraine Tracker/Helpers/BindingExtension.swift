//
//  BindingExtension.swift
//  Migraine Tracker
//
//  Created by Filby, Vincent on 5/1/22.
//

import Foundation
import SwiftUI

extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(
            get: {
                self.wrappedValue ?? defaultValue
                
            },
            set: {
                self.wrappedValue = $0
                
            }
        )
    }
}
