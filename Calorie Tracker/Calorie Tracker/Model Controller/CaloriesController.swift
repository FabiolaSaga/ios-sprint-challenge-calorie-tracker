//
//  CaloriesController.swift
//  Calorie Tracker
//
//  Created by Fabiola S on 12/16/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import Foundation

class CaloriesController {
    private (set) var calories: [Calories] = []
    
    func createCalories(withCalorieCount calorieCount: String) {
        let calories = Calories(calories: calorieCount)
        self.calories.append(calories)
        
        do {
            try self.saveToPersistantStore()
        } catch {
            NSLog("Error trying to save to Core Data")
        }
    }
    
    func deleteCalories(withCalorie calories: Calories) {
        let moc = CoreDataStack.shared.mainContext
        moc.delete(calories)
        
        do {
            try self.saveToPersistantStore()
        } catch {
            NSLog("Error saving after delete method")
        }
    }
    
    func saveToPersistantStore() throws {
        let moc = CoreDataStack.shared.mainContext
        try moc.save()
    }
}
