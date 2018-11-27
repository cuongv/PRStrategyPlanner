//
//  PowerRangerView.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/25/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import UIKit

final class PRView: UIView {
  typealias CompleteClosure = () -> Void
  static let size: CGFloat = 40
  
  private let aniDuration = 0.2
  private var aniLayer: CALayer!
  var viewModel: PRViewViewModel!
  
  init(frame: CGRect, color: UIColor, viewModel: PRViewViewModel) {
    super.init(frame: frame)
    //Prevent multi-drag issues for now
    isExclusiveTouch = true
    self.viewModel = viewModel
    
    aniLayer = CALayer()
    aniLayer.backgroundColor = color.cgColor
    aniLayer.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
    layer.addSublayer(aniLayer)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func getLayerColor() -> UIColor {
    return UIColor(cgColor: aniLayer.backgroundColor!)
  }
  
  func updatePosition() {
    viewModel.x = Int16(frame.origin.x)
    viewModel.y = Int16(frame.origin.y)
  }
  
  func runShowAnimation(_ completed: @escaping CompleteClosure = {}) {
    CATransaction.begin()
    CATransaction.setAnimationDuration(aniDuration)
    CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(controlPoints: 0.3, 0.6, 0.7, 1.3))
    CATransaction.setCompletionBlock {
      completed()
    }
    
    let r = CGAffineTransform(rotationAngle: 2 * .pi)
    let s = CGAffineTransform(scaleX: 1, y: 1)
    aniLayer.setAffineTransform(r.concatenating(s))
    
    let rotate = CABasicAnimation(keyPath: "transform.rotation.z")
    rotate.fromValue = 0.1
    rotate.toValue = 2 * CGFloat.pi
    aniLayer.add(rotate, forKey: nil)
    
    let scale = CABasicAnimation(keyPath: "transform.scale")
    scale.fromValue = 0
    scale.toValue = 1
    aniLayer.add(scale, forKey: nil)
    
    CATransaction.commit()
  }
  
  func runHideAnimation(_ completed: @escaping CompleteClosure = {}) {
    CATransaction.begin()
    CATransaction.setAnimationDuration(aniDuration)
    CATransaction.setCompletionBlock {
      completed()
    }
    
    let r = CGAffineTransform(rotationAngle: 0)
    let s = CGAffineTransform(scaleX: 0.01, y: 0.01)
    aniLayer.setAffineTransform(r.concatenating(s))
    
    let rotate = CABasicAnimation(keyPath: "transform.rotation.z")
    rotate.fromValue = 2 * CGFloat.pi
    rotate.toValue = 0
    aniLayer.add(rotate, forKey: nil)
    
    let scale = CABasicAnimation(keyPath: "transform.scale")
    scale.fromValue = 1
    scale.toValue = 0.01
    aniLayer.add(scale, forKey: nil)
    
    CATransaction.commit()
  }
}
