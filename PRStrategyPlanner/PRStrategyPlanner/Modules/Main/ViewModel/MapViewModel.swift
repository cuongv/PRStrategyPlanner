//
//  MapViewModel.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/25/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import Foundation

typealias InsertCallback = (_ viewModel: PowerRangerViewModel) -> Void
typealias RemoveCallback = (_ viewModel: PowerRangerViewModel) -> Void

final class MapViewModel {
  private var prViewModels: [PowerRangerViewModel] = []
  
  //We may update this project with RxSwift late. Use just block to bind data for now
  private var insertPRCallback: InsertCallback?
  private var removePRCallback: RemoveCallback?
  
  func setInsertCallback(callback: @escaping InsertCallback) {
    insertPRCallback = callback
  }
  
  func setRemoveCallback(callback: @escaping RemoveCallback) {
    removePRCallback = callback
  }
}
