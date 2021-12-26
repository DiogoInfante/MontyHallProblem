//
//  LeverView.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 26/12/21.
//

import UIKit
import Foundation

protocol LeverDelegate: AnyObject {
    func run()
}
/// Lever View that triggers a experiment
class LeverView: UIView {
    /// Rail where the lever runs
    let rail = AssetView(.rail, subView: UIView())
    /// Lever
    let lever = AssetView(.lever, subView: UIView())
    /// Delegate
    weak var delegate: LeverDelegate?
    /// Initializes a lever view
    init() {
        super.init(frame: .zero)
        setupGestures()
        setupUI()
    }
    /// Adds constraints to rail - Hierarchy 1.
    fileprivate func railConstraints() {
        rail.translatesAutoresizingMaskIntoConstraints = false
        rail.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        rail.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        rail.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        rail.heightAnchor.constraint(equalTo: rail.widthAnchor, multiplier: 0.095).isActive = true
    }
    /// Adds constraints to rail - Hierarchy 2.
    fileprivate func leverConstraints() {
        lever.translatesAutoresizingMaskIntoConstraints = false
        lever.centerXAnchor.constraint(equalTo: rail.leftAnchor).isActive = true
        lever.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        lever.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive = true
        lever.widthAnchor.constraint(equalTo: lever.heightAnchor).isActive = true
    }
    /// Gesture recognizer setup
    func setupGestures() {
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        lever.subView.addGestureRecognizer(gestureRecognizer)
        lever.subView.isUserInteractionEnabled = true
    }
    /// Handles gesture to move the lever guided by the rail
    ///     - Parameters:
    ///         - sender: Pan gesture recognizer used to track location
    @objc private func handlePan(_ sender: UISwipeGestureRecognizer) {
        /// Bounds
        let minX = rail.frame.origin.x
        let maxX = rail.frame.origin.x + rail.frame.maxX
        /// Move condition
        if (minX...maxX).contains(sender.location(in: self).x) {
            lever.center = CGPoint(x: sender.location(in: self).x, y: lever.center.y)
        }
        /// Trigger condition
        if sender.state == UIGestureRecognizer.State.ended {
            if lever.center.x >= maxX*0.95 {
                delegate?.run()
                lever.isUserInteractionEnabled = false
                lever.translation(duration: 1, delay: 2, centerTo: CGPoint(x: minX, y: lever.center.y)) { result in
                    self.lever.isUserInteractionEnabled = true
                }
            } else {
                lever.center = CGPoint(x: rail.frame.origin.x, y: lever.center.y)
            }
        }
    }
    /// Setups UI
    func setupUI() {
        /// Hierarchy 1 - rail.
        self.addSubview(rail)
        railConstraints()
        /// HIerarchy 2 - lever
        self.addSubview(lever)
        leverConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
