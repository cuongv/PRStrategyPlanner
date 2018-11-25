//
//  MainViewModel.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/25/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import Foundation

struct MainViewModel {
  private var prListViewModel = PRListViewModel() {
    didSet {
      self.reloadListTableBlock()
    }
  }
  
  //We may update this project with RxSwift late. User just block to bind data for now
  var reloadListTableBlock = {}
}
