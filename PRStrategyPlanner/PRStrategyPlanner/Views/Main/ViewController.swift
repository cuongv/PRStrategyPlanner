//
//  ViewController.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/25/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var viewMap: PRMapView!
  @IBOutlet weak var tblViewPR: UITableView!
  private var prListViewModel: PRListViewModel!
  private var mapViewModel: PRMapViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mapViewModel = PRMapViewModel { [weak self] state in
      switch state.editingStype {
      case let .insert(powerRangerVM, _):
        self?.viewMap.addNewPR(powerRangerVM)
      case let .remove(powerRangerVM, _):
        self?.viewMap.removePR(powerRangerVM)
      default:
        break
      }
    }

    prListViewModel = PRListViewModel { [weak self] state in
      switch state.editingStype {
      case let .update(prCellVM, index):
        self?.tblViewPR.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        self?.mapViewModel.updateItem(prCellVM)
      default:
        self?.tblViewPR.reloadData()
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
