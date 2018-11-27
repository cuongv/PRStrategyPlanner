//
//  DataConnector.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/27/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataConnector: DataConnectorProtocol {
  private var mainContext: NSManagedObjectContext
  
  init(mainContext: NSManagedObjectContext) {
    self.mainContext = mainContext
  }
  
  func saveData(data: [Any]) {
    //Remove all old data - Improve it later by saving the change only
    let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: PowerRanger.fetchRequest())
    do {
      try mainContext.execute(batchDeleteRequest)
    } catch let error {
      print("Error loading data \(error.localizedDescription)")
    }
    
    if let entityDes = NSEntityDescription.entity(forEntityName: String(describing: PowerRanger.self), in: mainContext),
      let prViewModels = data as? [PRViewViewModel] {
      for prVM in prViewModels {
        let pr = PowerRanger(entity: entityDes, insertInto: mainContext)
        pr.x = prVM.x
        pr.y = prVM.y
        pr.color = prVM.color.toHex
      }
    }
    
    if mainContext.hasChanges {
      do {
        try mainContext.save()
      } catch {
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
  
  func loadData() -> [Any] {
    do {
      return try mainContext.fetch(PowerRanger.fetchRequest())
    } catch let error {
      print("Error loading data \(error.localizedDescription)")
    }
    return []
  }
}
