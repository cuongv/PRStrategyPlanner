//
//  PRListViewModel.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/25/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import Foundation

final class PRListViewModel {
  private var cellViewModels: [PRListCellViewModel] {
    didSet {
      reloadListCallback()
    }
  }
  
  var reloadListCallback = {}
  var reloadCellCalback: (indexpath: IndexPath) -> Void = 

  init() {
    cellViewModels = [PRListCellViewModel(name: "Red", color: .red),
                      PRListCellViewModel(name: "Yellow", color: .yellow),
                      PRListCellViewModel(name: "Green", color: .green),
                      PRListCellViewModel(name: "Blue", color: .blue),
                      PRListCellViewModel(name: "Black", color: .black)]
  }
  
  func numberOfItems() -> Int {
    return cellViewModels.count
  }
  
  func getItem(atIndex index: Int) -> PRListCellViewModel? {
    guard index < cellViewModels.count else { return nil }
    return cellViewModels[index]
  }
}
