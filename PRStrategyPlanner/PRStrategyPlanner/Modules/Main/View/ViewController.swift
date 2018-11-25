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
  private lazy var mainViewModel = MainViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func btnSaveClicked(_ sender: Any) {
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCell(withIdentifier: "PRCell")
    if cell == nil {
      cell = PRTableViewCell()
    }
    return cell!
  }
}
