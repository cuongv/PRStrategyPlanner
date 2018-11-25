//
//  PRListViewModel.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/25/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import Foundation

struct PRListViewModel {
  private var cellViewModels: [PRListCellViewModel]
  
  init() {
    cellViewModels = [PRListCellViewModel(name: "Red", color: .red),
                      PRListCellViewModel(name: "Yellow", color: .yellow),
                      PRListCellViewModel(name: "Green", color: .green),
                      PRListCellViewModel(name: "Blue", color: .blue),
                      PRListCellViewModel(name: "Black", color: .black)]
  }
}
