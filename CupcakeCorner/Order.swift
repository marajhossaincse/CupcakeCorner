//
//  Order.swift
//  CupcakeCorner
//
//  Created by Maraj Hossain on 10/2/23.
//

import SwiftUI

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    @Published var type = 0
    @Published var quantity = 3

    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }

    @Published var extraFrosting = false
    @Published var addSprinkles = false
}