//
//  PowerRangerView.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/25/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import UIKit

final class PowerRangerView: UIView {
  typealias CompleteBlock = () -> Void
  
  private let aniDuration = 0.5
  private var aniLayer: CALayer!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    //Prevent multi-drag issues for now
    isExclusiveTouch = true
    aniLayer = CALayer()
    aniLayer.backgroundColor = UIColor.red.cgColor
    aniLayer.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
    layer.addSublayer(aniLayer)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func runShowAnimation(_ completed: @escaping CompleteBlock = {}) {
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
  
  func runHideAnimation(_ completed: @escaping CompleteBlock = {}) {
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
