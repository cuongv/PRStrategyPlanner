//
//  DataConnector.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/27/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import Foundation
import CoreData
import UIKit

struct CoreDataConnector: DataConnectorProtocol {
//  typealias DataType = PRViewViewModel
  private var mainContext: NSManagedObjectContext
  
  init(mainContext: NSManagedObjectContext) {
    self.mainContext = mainContext
  }
  
  func saveData(data: [PRViewViewModel]) {
    //Remove all old data - Improve it later by saving the change only
    let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: PowerRanger.fetchRequest())
    do {
      try mainContext.execute(batchDeleteRequest)
    } catch let error {
      print("Error loading data \(error.localizedDescription)")
    }
    
    guard let entityDes = NSEntityDescription.entity(forEntityName: String(describing: PowerRanger.self),
                                                     in: mainContext) else { return }
    for prVM in data {
      let pr = PowerRanger(entity: entityDes, insertInto: mainContext)
      pr.x = prVM.x
      pr.y = prVM.y
      pr.color = prVM.color.toHex
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
  
  func loadData() -> [PRViewViewModel] {
    do {
      let data = try mainContext.fetch(PowerRanger.fetchRequest()) as [PowerRanger]
      var prVMs = [PRViewViewModel]()
      for pr in data {
        if let strColor = pr.color, let color = UIColor(hex: strColor) {
          prVMs.append(PRViewViewModel(x: pr.x, y: pr.y, color: color))
        }
      }
      return prVMs
    } catch let error {
      print("Error loading data \(error.localizedDescription)")
    }
    return []
  }
}
