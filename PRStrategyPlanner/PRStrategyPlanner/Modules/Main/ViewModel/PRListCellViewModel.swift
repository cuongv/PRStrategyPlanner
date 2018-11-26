//
//  PRListCellViewModel.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/25/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import UIKit

final class PRListCellViewModel {
  var name: String
  var color: UIColor
  var isSelected: Bool {
    didSet {
      reloadCellCallback()
    }
  }
  var reloadCellCallback = {}
  
  init(name: String, color: UIColor, isSelected: Bool = false) {
    self.name = name
    self.color = color
    self.isSelected = isSelected
  }

  func cellPressed() {
    isSelected = !isSelected
  }
}
