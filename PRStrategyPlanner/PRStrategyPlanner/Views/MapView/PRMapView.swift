//
//  MapView.swift
//  PRStrategyPlanner
//
//  Created by Vuong Cuong on 11/26/18.
//  Copyright © 2018 Vuong Cuong. All rights reserved.
//

import UIKit

class PRMapView: UIView {
  private var animator: UIDynamicAnimator!
  private var attachment: UIAttachmentBehavior!
  private var collision: UICollisionBehavior!
  private var customBehavior: UIDynamicItemBehavior!
  
  var listRangerView = [PRView]()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    animator = UIDynamicAnimator(referenceView: self)

    collision = UICollisionBehavior()
    collision.translatesReferenceBoundsIntoBoundary = true
    collision.collisionMode = .everything
    animator.addBehavior(collision)
    
    customBehavior = UIDynamicItemBehavior()
    customBehavior.density = 0.01
    customBehavior.elasticity = 0
    customBehavior.resistance = 100
    customBehavior.friction = 0.0
    customBehavior.allowsRotation = false
    animator.addBehavior(customBehavior)
  }
  
  func addNewPR(_ powerRangerVM: PRViewViewModel) {
    let prView = PRView(frame: CGRect(x: self.bounds.size.width / 2,
                                               y: self.bounds.size.height / 2,
                                               width: PRView.size,
                                               height: PRView.size),
                                 color: powerRangerVM.color)
    self.addSubview(prView)
    prView.runShowAnimation()
    
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(pannedView))
    prView.addGestureRecognizer(panGesture)
    prView.isUserInteractionEnabled = true
    
    collision.addItem(prView)
    customBehavior.addItem(prView)
    listRangerView.append(prView)
  }
  
  func removePR(_ powerRangerVM: PRViewViewModel) {
    for prView in listRangerView.filter({ $0.getLayerColor().toHex == powerRangerVM.color.toHex }) {
        prView.runHideAnimation { [weak self] in
          self?.collision.removeItem(prView)
          self?.customBehavior.removeItem(prView)
          prView.removeFromSuperview()
      }
    }
    listRangerView = listRangerView.filter { $0.getLayerColor().toHex != powerRangerVM.color.toHex }
  }
  
  @objc private func pannedView(recognizer: UIPanGestureRecognizer) {
    switch recognizer.state {
    case .began:
      attachment = UIAttachmentBehavior(item: recognizer.view!, attachedToAnchor: recognizer.location(in: self))
      attachment.length = 0
      attachment.frequency = 10
      attachment.damping = 5
      animator.addBehavior(attachment)
    case .changed:
      attachment.anchorPoint = recognizer.location(in: self)
    case .ended, .cancelled, .failed:
      animator.removeBehavior(attachment)
    default:
      break
    }
  }
}
