//
//  ViewController.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/25/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var viewMap: UIView!
  @IBOutlet weak var tblViewPR: UITableView!
  private var prListViewModel: PRListViewModel!
  private var mapViewModel = MapViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mapViewModel.setInsertCallback { insertedPRModel in
      
    }
    
    mapViewModel.setRemoveCallback { insertedPRModel in
      
    }
    
    prListViewModel = PRListViewModel { [weak self] state in
      switch state.editingStype {
      case let .update(_, index):
        self?.tblViewPR.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
      default:
        self?.tblViewPR.reloadData()
        break
      }
    }
  }
  
  @IBAction func btnSaveClicked(_ sender: Any) {
  }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return prListViewModel.numberOfItems()
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCell(withIdentifier: "PRCell") as? PRTableViewCell
    if cell == nil {
      cell = PRTableViewCell()
    }
    let item = prListViewModel.getItem(atIndex: indexPath.row)
    cell?.configCell(item)
    return cell!
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    prListViewModel.pressedItem(atIndex: indexPath)
  }
}
