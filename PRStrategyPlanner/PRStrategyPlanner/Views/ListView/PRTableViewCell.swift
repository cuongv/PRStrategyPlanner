//
//  PRTableViewCell.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/25/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import UIKit

class PRTableViewCell: UITableViewCell {
  @IBOutlet weak var viewColor: UIView!
  @IBOutlet weak var lblColorName: UILabel!

  func configCell(_ cellVM: PRListCellViewModel?) {
    if let cellVM = cellVM {
      lblColorName.text = cellVM.name
      if cellVM.selected {
        lblColorName.textColor = .gray
        viewColor.backgroundColor = .gray
      } else {
        viewColor.backgroundColor = cellVM.color
        lblColorName.textColor = cellVM.color
      }
    }
  }
}
