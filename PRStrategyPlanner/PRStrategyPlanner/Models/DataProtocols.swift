//
//  DatabaseProtocols.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/27/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import Foundation

protocol DataConnectorProtocol {
  func saveData(data: [Any])
  func loadData() -> [Any]
}
