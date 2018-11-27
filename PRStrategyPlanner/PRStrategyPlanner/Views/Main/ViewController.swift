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
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let connector = CoreDataConnector(mainContext: appDelegate.persistentContainer.viewContext)

    prListViewModel = PRListViewModel(connector: connector) { [weak self] state in
      switch state.editingStype {
      case let .update(prCellVM, index):
        self?.tblViewPR.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
        self?.mapViewModel.updateItem(prCellVM)
      default:
        self?.tblViewPR.reloadData()
      }
    }
    mapViewModel = PRMapViewModel(connector: connector) { [weak self] state in
      switch state.editingStype {
      case let .insert(powerRangerVM, _):
        self?.viewMap.addNewPR(powerRangerVM)
      case let .remove(powerRangerVM, _):
        self?.viewMap.removePR(powerRangerVM)
      default:
        break
      }
    }
    mapViewModel.loadData()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    mapViewModel.defaultPosition = CGPoint(x: viewMap.frame.size.width / 2, y: viewMap.frame.size.height / 2)
  }

  @IBAction func btnSaveClicked(_ sender: Any) {
    mapViewModel.saveData()
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
