//
//  Collection+_.swift
//  University Mobile Exercise
//
//  Created by Azizbek Asadov on 21.03.2025.
//

import Foundation

extension Optional where Wrapped: Collection {
    /// A Boolean value indicating if the collection is empty or nil.
    var isEmptyOrNil: Bool {
        return self?.isEmpty ?? true
    }
}

extension Optional where Wrapped == String {
    var isEmptyOrNil: Bool {
        if let self {
            return self != ""
        }
        
        return true
    }
}
