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

  func configCell(_ cellVM: PRCellViewModel?) {
    guard let cellVM = cellVM else { return }
    lblColorName.text = cellVM.name
    lblColorName.textColor = cellVM.selected ? .gray : cellVM.color
    viewColor.backgroundColor = cellVM.selected ? .gray : cellVM.color
  }
}
