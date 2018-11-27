//
//  PowerRangerViewModel.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/26/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import UIKit

final class PRViewViewModel {
  var x: Int16
  var y: Int16
  var color: UIColor
  
  init(x: Int16, y: Int16, color: UIColor) {
    self.x = x
    self.y = y
    self.color = color
  }
}
