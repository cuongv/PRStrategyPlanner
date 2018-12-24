//
//  AnyConnector.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 12/2/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import Foundation

struct AnyConnector<T>: DataConnectorProtocol {
  typealias DataType = T
  private let _saveData: ([T]) -> Void
  private let _loadData: () -> [T]
  
  init<C: DataConnectorProtocol>(_ connector: C) where C.DataType == T {
    _saveData = connector.saveData
    _loadData = connector.loadData
  }
  
  func saveData(data: [T]) {
    _saveData(data)
  }
  
  func loadData() -> [T] {
    return _loadData()
  }
}
