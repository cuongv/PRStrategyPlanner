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
  private var mainViewModel = MainViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mainViewModel.mapViewModel.setInsertCallback { insertedPRModel in
      
    }
    
    mainViewModel.mapViewModel.setRemoveCallback { insertedPRModel in
      
    }
    
    mainViewModel.prListViewModel.reloadListCallBack = { [weak self] in
      self?.tblViewPR.reloadData()
    }
  }
  
  @IBAction func btnSaveClicked(_ sender: Any) {
  }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return mainViewModel.prListViewModel.numberOfItems()
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCell(withIdentifier: "PRCell") as? PRTableViewCell
    if cell == nil {
      cell = PRTableViewCell()
    }
    let item = mainViewModel.prListViewModel.getItem(atIndex: indexPath.row)
    cell?.lblColorName.text = item?.name
    cell?.viewColor.backgroundColor = item?.color
    return cell!
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)
    let item = mainViewModel.prListViewModel.getItem(atIndex: indexPath.row)
    item?.cellPressed()
  }
}
