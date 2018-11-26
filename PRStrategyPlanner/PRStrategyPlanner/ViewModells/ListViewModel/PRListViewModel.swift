//
//  PRListViewModel.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/25/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import Foundation

final class PRListViewModel: ViewModelArrayProtocol {
  typealias T = PRListCellViewModel
  var state: State<T> {
    didSet {
      callback(state)
    }
  }
  private let callback: (State<T>) -> Void

  init(callback: @escaping (State<T>) -> Void) {
    self.callback = callback
    let cellViewModels = [PRListCellViewModel(name: "Red", color: .red, selected: false),
                      PRListCellViewModel(name: "Yellow", color: .yellow, selected: false),
                      PRListCellViewModel(name: "Green", color: .green, selected: false),
                      PRListCellViewModel(name: "Blue", color: .blue, selected: false),
                      PRListCellViewModel(name: "Black", color: .black, selected: false)]
    self.state = State(data: cellViewModels, editingStype: .none)
  }
  
  func numberOfItems() -> Int {
    return state.data.count
  }
  
  func getItem(atIndex index: Int) -> PRListCellViewModel? {
    guard index < state.data.count else { return nil }
    return state.data[index]
  }
  
  func pressedItem(atIndex index: IndexPath) {
    if let item = getItem(atIndex: index.row) {
      let newItem = PRListCellViewModel(name: item.name, color: item.color, selected: !item.selected)
      state.editingStype = .update(newItem, index.row)
    }
  }
}
