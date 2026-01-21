//
//  SliderView.swift
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
    
    /// Constraint that controls the horizontal position
    private var pointerLeftConstraint: NSLayoutConstraint?
    
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
        
        // Save the constraint to update it during the pan gesture
        pointerLeftConstraint = pointer.centerXAnchor.constraint(equalTo: bar.leftAnchor)
        pointerLeftConstraint?.isActive = true
        
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
    @objc private func handlePan(_ sender: UIPanGestureRecognizer) {
        let barWidth = bar.frame.width
        let location = sender.location(in: bar)
        
        // Clamp the value between 0 (start of bar) and barWidth (end of bar)
        let clampedX = max(0, min(location.x, barWidth))
        
        // Update the constraint instead of the frame
        pointerLeftConstraint?.constant = clampedX
        
        if sender.state == .ended {
            let progress = clampedX / barWidth
            
            if progress >= 0.98 {
                delegate?.endCourse()
                // Return to start with a delay if completed
                animateBack(duration: 0.5, delay: 1.0)
            } else {
                // Return immediately if released early
                animateBack(duration: 0.2, delay: 0.0)
            }
        }
    }
    
    /// Animates slider translation back to start position
    func animateBack(duration: CGFloat, delay: CGFloat) {
        pointer.isUserInteractionEnabled = false
        
        // Set the target position back to the start
        pointerLeftConstraint?.constant = 0
        
        // Standard UIKit animation for constraints
        UIView.animate(withDuration: TimeInterval(duration),
                       delay: TimeInterval(delay),
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseInOut,
                       animations: {
            self.layoutIfNeeded() // Forces the view to animate to the new constraint value
        }) { _ in
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
