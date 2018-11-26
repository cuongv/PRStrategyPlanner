//
//  MapViewModel.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/25/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import Foundation

final class PRMapViewModel: ViewModelArrayProtocol {
  typealias T = PRViewViewModel
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
  
  func updateItem(_ prCellVM: PRCellViewModel) {
    if prCellVM.selected {
      state.editingStype = .insert(PRViewViewModel(x: 0, y: 0, color: prCellVM.color), state.data.count)
    } else {
      for i in 0..<state.data.count {
        let prVm = state.data[i]
        if prVm.color.toHex == prCellVM.color.toHex {
          state.editingStype = .remove(prVm, i)
          //Only remove one element for now -> break
          break
        }
      }
    }
  }
}
