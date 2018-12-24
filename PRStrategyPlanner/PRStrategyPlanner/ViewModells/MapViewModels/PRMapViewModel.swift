//
//  MapViewModel.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/25/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import UIKit
import CoreData

final class PRMapViewModel: ViewModelArrayProtocol {
  typealias T = PRViewViewModel
  private(set) var state: State<T> {
    didSet {
      callback(state)
    }
  }
  private let callback: (State<T>) -> Void
  private var dataConnector: AnyConnector<T>
  var defaultPosition: CGPoint
  
  init(connector: AnyConnector<T>, position: CGPoint = CGPoint.zero, callback: @escaping (State<T>) -> Void) {
    self.callback = callback
    self.defaultPosition = position
    self.dataConnector = connector
    self.state = State(data: [], editingStype: .none)
  }
  
  func loadData() {
    for prModel in dataConnector.loadData() {
      state.editingStype = .insert(prModel, state.data.count)
    }
  }
  
  func updateItem(_ prCellVM: PRCellViewModel) {
    if prCellVM.selected {
      state.editingStype = .insert(PRViewViewModel(x: Int16(defaultPosition.x),
                                                   y: Int16(defaultPosition.y),
                                                   color: prCellVM.color), state.data.count)
    } else if let index = state.data.index(where: { $0.color.toHex == prCellVM.color.toHex }) {
      state.editingStype = .remove(state.data[index], index)
    }
  }
  
  func saveData() {
    dataConnector.saveData(data: state.data)
  }
}
