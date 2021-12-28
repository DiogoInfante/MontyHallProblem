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
    fileprivate func setupGestures() {
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        pointer.addGestureRecognizer(gestureRecognizer)
        pointer.isUserInteractionEnabled = true
    }
    /// Handles gesture to move the pointer guided by the bar
    ///     - Parameters:
    ///         - sender: Pan gesture recognizer used to track location
    /// Discussion: Couldn't use center method because the recalculation after CGAffineTransform does not appear to happen automatically in UIKit. So used origin to control the pointer position instead.
    @objc private func handlePan(_ sender: UISwipeGestureRecognizer) {
        /// Bounds
        let minX = bar.frame.origin.x
        let maxX = bar.frame.origin.x + bar.frame.maxX
        /// Half slider width
        let halfW = pointer.frame.width/2
        /// Pointer move condition
        if (minX...maxX).contains(sender.location(in: self).x) {
            pointer.frame.origin = CGPoint(x: sender.location(in: self).x-halfW,
                                           y: pointer.frame.origin.y)
        }
        /// Finger left the screen
        if sender.state == UIGestureRecognizer.State.ended {
            /// Trigger condition: Delays and return smoothly
            if pointer.frame.origin.x+halfW >= maxX*0.98 {
                delegate?.endCourse()
                animateBack(duration: 0.5, delay: 1, to: CGPoint(x: minX, y: pointer.center.y))
            } else {
                /// Instantly returns to start position if the gesture ended and not trigged 
                animateBack(duration: 0.1, delay: 0, to: CGPoint(x: minX, y: pointer.center.y))
            }
        }
    }
    /// Animates slider translation back to start position
    func animateBack(duration: CGFloat, delay: CGFloat, to point: CGPoint) {
        pointer.isUserInteractionEnabled = false
        pointer.translation(duration: duration, delay: delay,
                            centerTo: point) { result in
            self.pointer.isUserInteractionEnabled = true
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
