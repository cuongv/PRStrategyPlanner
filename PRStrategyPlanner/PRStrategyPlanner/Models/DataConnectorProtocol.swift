//
//  DatabaseProtocols.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/27/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import Foundation

protocol DataConnectorProtocol {
  associatedtype DataType
  func saveData(data: [DataType])
  func loadData() -> [DataType]
}
