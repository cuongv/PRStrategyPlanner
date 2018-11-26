//
//  MapViewModel.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/25/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import Foundation

final class MapViewModel: ViewModelArrayProtocol {
  typealias T = PowerRangerViewModel
  var state: State<T> {
    didSet {
      callback(state)
    }
  }
  private let callback: (State<T>) -> Void
  
  init(callback: @escaping (State<T>) -> Void) {
    self.callback = callback
    self.state = State(data: [], editingStype: .none)
  }
}
