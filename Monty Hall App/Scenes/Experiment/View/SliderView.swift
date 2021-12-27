//
//  LeverView.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 26/12/21.
//

import UIKit
import Foundation

/// Slider View Delegate
///     - run: Trigged by the action of the slider reaching the end of the course
protocol SliderViewDelegate: AnyObject {
    func endCourse()
}
/// Slider View that triggers a experiment
class SliderView: UIView {
    /// Bar where the pointer runs
    let bar: AssetView<UIView>
    /// pointer
    let pointer: AssetView<UIView>
    /// Delegate
    weak var delegate: SliderViewDelegate?
    /// Initializes a lever view
    init(bar: Asset, pointer: Asset) {
        self.bar = AssetView(bar, subView: UIView())
        self.pointer = AssetView(pointer, subView: UIView())
        super.init(frame: .zero)
        setupGestures()
        setupUI()
    }
    /// Adds constraints to bar - Hierarchy 1.
    fileprivate func barConstraints() {
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bar.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        bar.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        bar.heightAnchor.constraint(equalTo: bar.widthAnchor, multiplier: 0.095).isActive = true
    }
    /// Adds constraints to rail - Hierarchy 2.
    fileprivate func pointerConstraints() {
        pointer.translatesAutoresizingMaskIntoConstraints = false
        pointer.centerXAnchor.constraint(equalTo: bar.leftAnchor).isActive = true
        pointer.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        pointer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive = true
        pointer.widthAnchor.constraint(equalTo: pointer.heightAnchor).isActive = true
    }
    /// Gesture recognizer setup
    func setupGestures() {
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        pointer.subView.addGestureRecognizer(gestureRecognizer)
        pointer.subView.isUserInteractionEnabled = true
    }
    /// Handles gesture to move the pointer guided by the bar
    ///     - Parameters:
    ///         - sender: Pan gesture recognizer used to track location
    @objc private func handlePan(_ sender: UISwipeGestureRecognizer) {
        /// Bounds
        let minX = bar.frame.origin.x
        let maxX = bar.frame.origin.x + bar.frame.maxX
        /// Move condition
        if (minX...maxX).contains(sender.location(in: self).x) {
            pointer.center = CGPoint(x: sender.location(in: self).x, y: pointer.center.y)
        }
        /// Trigger condition
        if sender.state == UIGestureRecognizer.State.ended {
            if pointer.center.x >= maxX*0.95 {
                delegate?.endCourse()
                pointer.isUserInteractionEnabled = false
                pointer.translation(duration: 1, delay: 2, centerTo: CGPoint(x: minX, y: pointer.center.y)) { result in
                    self.pointer.isUserInteractionEnabled = true
                }
            } else {
                pointer.center = CGPoint(x: bar.frame.origin.x, y: pointer.center.y)
            }
        }
    }
    /// Setups UI
    func setupUI() {
        /// Hierarchy 1 - bar.
        self.addSubview(bar)
        barConstraints()
        /// HIerarchy 2 - pointer
        self.addSubview(pointer)
        pointerConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
