//
//  Calories+Convenience.swift
//  Calorie Tracker
//
//  Created by Fabiola S on 12/16/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import Foundation
import CoreData

extension Calories {
    // Initializes a Calorie Object
    convenience init(calories: String, added: Date = Date(), context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.calories = calories
        self.added = added
    }
    
    var date: String {
        guard let added = self.added else { return "" }
        
        let df = DateFormatter()
        df.dateFormat = "MMM d Y 'at' h:mm a"
        let date = df.string(from: added)
        return date
    }
}
