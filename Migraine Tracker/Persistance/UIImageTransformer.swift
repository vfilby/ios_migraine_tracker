//
//  UIImageTransformer.swift
//  Migraine Tracker
//
//  Created by Filby, Vincent on 4/28/22.
//

// Referencing: https://github.com/azamsharp/RoomsApp/blob/main/RoomsApp/NSColorTransformer.swift and https://stackoverflow.com/questions/3908910/how-should-i-store-uiimages-within-my-core-data-database


import Foundation
import UIKit

class UIImageTransformer: ValueTransformer {

    override func transformedValue(_ value: Any?) -> Any? {

        guard let image = value as? UIImage else { return nil }
        return image.pngData()
    }

    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }


        let image = UIImage( data: data )
        return image
    }

}
