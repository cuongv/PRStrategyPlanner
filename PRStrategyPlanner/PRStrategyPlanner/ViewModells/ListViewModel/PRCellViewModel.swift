//
//  PRListCellViewModel.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/25/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import UIKit

final class PRCellViewModel {
  private(set) var name: String
  private(set) var color: UIColor
  var selected: Bool
  
  init(name: String, color: UIColor, selected: Bool) {
    self.name = name
    self.color = color
    self.selected = selected
  }
}
