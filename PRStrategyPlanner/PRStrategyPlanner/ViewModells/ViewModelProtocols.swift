//
//  ViewModelProtocols.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/26/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import Foundation

protocol ViewModelArrayProtocol {
  associatedtype T
  var state: State<T> { get }
}

struct State<T> {
  enum EditingStype {
    case insert(T, Int)
    case update(T, Int)
    case remove(T, Int)
    case none
  }
  var data: [T]
  var editingStype: EditingStype {
    didSet {
      switch editingStype {
      case let .insert(newElement, index):
        data.insert(newElement, at: index)
      case let .update(newElement, index):
        if index < data.count {
          data[index] = newElement
        } else {
          assertionFailure("Index out of bound")
        }
      case let .remove(_, index):
        data.remove(at: index)
      default:
        break
      }
    }
  }
}
