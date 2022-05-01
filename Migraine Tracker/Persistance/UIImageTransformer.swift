//
//  UIImageTransformer.swift
//  Migraine Tracker
//
//  Created by Filby, Vincent on 4/28/22.
//

// Referencing: https://github.com/azamsharp/RoomsApp/blob/main/RoomsApp/NSColorTransformer.swift and https://stackoverflow.com/questions/3908910/how-should-i-store-uiimages-within-my-core-data-database


import Foundation
import UIKit

@objc(UIImageTransformer)
class UIImageTransformer: ValueTransformer {
    
    override class func transformedValueClass() -> AnyClass {
            return UIImage.self
        }

    override func transformedValue(_ value: Any?) -> Any? {

        guard let image = value as? UIImage else {
            NSLog( "returning nil" )
            return nil
        }
        return image.pngData()
    }

    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else {
            NSLog( "returning nil" )
            return nil
            
        }

        NSLog( "Returning image" )
        let image = UIImage( data: data )
        return image
    }

}
