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

  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
  }
}
