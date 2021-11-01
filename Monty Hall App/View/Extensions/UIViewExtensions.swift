//
//  UIViewExtensions.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 30/10/21.
//

import UIKit
    
// MARK: General Extensions
extension UIView {
    /// Calculates the distance from the center of the view to a point.
    /// - Parameters:
    ///     - point: Desired point to calculate the distance about.
    /// - Returns: A point containing the distance of each coordinate from a given to the center of the view.
    func centerTo(point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x - self.center.x, y: point.y - self.center.y)
    }
    /// Calculates the distance from the origin of the view to a point.
    /// - Parameters:
    ///     - point: Desired point to calculate the distance about.
    /// - Returns: A point containing the distance of each coordinate from a given to the origin of the view.
    func originTo(point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x - self.frame.origin.x, y: point.y - self.frame.origin.y)
    }
    /// Rotate a view by specified degrees
    /// - Parameter angle: angle in degrees
    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: radians);
        self.transform = rotation
    }
}
// MARK: Constraints Extensions
extension UIView {
    /// Constraints a subview to a received parent view.
    /// - Parameters:
    ///     - parent: Parent view to reference constraints.
    ///     - multiplier: Factor to rescale subview proportionally.
    func constraint(to parent: UIView, multiplier: CGFloat = 1) {
        translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: parent.centerYAnchor).isActive = true
        self.widthAnchor.constraint(equalTo: parent.widthAnchor, multiplier: multiplier).isActive = true
        self.heightAnchor.constraint(equalTo: parent.heightAnchor, multiplier: multiplier).isActive = true
    }
    /// Adds a scene to a root view.
    /// - Parameters:
    ///     - parent: Parent view to reference constraints.
    ///     - multiplier: Factor to rescale subview proportionally.
    func setScene(root: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: root.layoutMarginsGuide.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: root.layoutMarginsGuide.bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: root.layoutMarginsGuide.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: root.layoutMarginsGuide.trailingAnchor).isActive = true
    }
}
// MARK: Aniamtion Extensions
extension UIView {
    /// Rotation
    /// - Parameters:
    ///     - duration: Animation duration
    ///     - delay: Time delay before it start.
    ///     - fromValue: Start angle
    ///     - toValue: Finishing Angle
    ///     - repeatCount: Repetion nuber
    ///     - effect: Type of animation effect
    func rotate(duration: CFTimeInterval = 1,
                delay: CFTimeInterval = 0.0,
                fromValue: CGFloat = -0.5,
                toValue: CGFloat = 0.5,
                repeatCount: Float = 5,
                effect: AnimationOptions = .curveEaseIn,
                completion:@escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
                
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: effect,
                       animations: {
                        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
                        
                        rotateAnimation.fromValue = fromValue
                        rotateAnimation.toValue = toValue
                        rotateAnimation.isRemovedOnCompletion = true
                        rotateAnimation.duration = duration
                        rotateAnimation.repeatCount = repeatCount
                        self.layer.add(rotateAnimation, forKey: nil)
                        
                       }, completion: completion)
    }
    /// Fade In
    /// - Parameters:
    ///     - duration: Animation duration
    ///     - delay: Time delay before it start.
    ///     - effect: Type of animation effect
    func fadeIn(duration: TimeInterval = 0.5,
                delay: TimeInterval = 0.0,
                effect: AnimationOptions = .curveEaseIn,
                completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: effect,
                       animations: {
                        
                        self.alpha = 1.0
                        
                       }, completion: completion)
    }
    /// Fade Out
    /// - Parameters:
    ///     - duration: Animation duration
    ///     - delay: Time delay before it start.
    ///     - effect: Type of animation effect
    func fadeOut(duration: TimeInterval = 0.5,
                 delay: TimeInterval = 0.0,
                 effect: AnimationOptions = .curveEaseIn,
                 completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: effect,
                       animations: {
                        
                        self.alpha = 0.0
                        
                       }, completion: completion)
    }
    /// Fades to a custom opacity
    /// - Parameters:
    ///     - duration: Animation duration
    ///     - delay: Time delay before it start.
    ///     - toAlpha: Custom final opacity
    ///     - effect: Type of animation effect
    func customFade(duration: TimeInterval = 0.5,
                    delay: TimeInterval = 0.0,
                    effect: AnimationOptions = .curveEaseIn,
                    toAlpha: CGFloat,
                    completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: effect,
                       animations: {

                        self.alpha = toAlpha
                        
                       }, completion: completion)
    }
    /// Appear
    /// - Parameters:
    ///     - duration: Animation duration
    ///     - delay: Time delay before it start.
    func appear(duration: TimeInterval = 0.01,
                delay: TimeInterval = 0.0,
                completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: UIView.AnimationOptions.curveEaseIn,
                       animations: {
                        
                        self.alpha = 1.0
                        
                       }, completion: completion)
    }
    /// Disappear
    /// - Parameters:
    ///     - duration: Animation duration
    ///     - delay: Time delay before it start.
    func disappear(duration: TimeInterval = 0.01,
                   delay: TimeInterval = 0.0,
                   completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: UIView.AnimationOptions.curveEaseIn,
                       animations: {
                        
                        self.alpha = 0.0
                        
                       }, completion: completion)
    }
    /// Spring Animation
    /// - Parameters:
    ///     - duration: Animation duration
    ///     - delay: Time delay before it start.
    ///     - damping: Damping coefficient
    ///     - initialVelocity: Inicial velocity of animation
    ///     - scale: Scaling ration
    ///     - effect: Type of animation effect
    func springAnimation(duration: TimeInterval = 0.01,
                         delay: TimeInterval = 0.0,
                         damping: CGFloat = 0.2,
                         initialVelocity: CGFloat = 0,
                         scale: CGFloat = 0.9,
                         effect: AnimationOptions = .curveEaseIn,
                         completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        
        UIView.animate(withDuration: duration,
                       delay: delay,
                       usingSpringWithDamping: damping,
                       initialSpringVelocity: initialVelocity,
                       options: effect, animations: {
                        
                        // Scales
                        self.transform = CGAffineTransform(scaleX: scale, y: scale)
                        
                       }) { (_) in
            
            UIView.animate(withDuration: duration,
                           delay: delay,
                           usingSpringWithDamping: damping,
                           initialSpringVelocity: initialVelocity,
                           options: effect, animations: {
                            
                            // Returns to main Size
                            self.transform = CGAffineTransform(scaleX: 1, y: 1)
                            
                           }, completion: completion)
        }
    }
    /// Translates the View Center to a Desired Point
    /// - Parameters:
    ///     - duration: Animation duration
    ///     - delay: Time delay before it start.
    ///     - centerTo: Desired point to translate center to
    func translation(duration: TimeInterval = 1,
                   delay: TimeInterval = 0.0,
                   centerTo: CGPoint,
                   completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: UIView.AnimationOptions.curveEaseIn,
                       animations: {
                        
                        // Distance from center to point
                        let distance = self.centerTo(point: centerTo)

                        // Translation delta
                        self.transform = CGAffineTransform(translationX: distance.x, y: distance.y)

                       }, completion: completion)
    }
    /// Translates the View Origin to a Desired Point
    /// - Parameters:
    ///     - duration: Animation duration
    ///     - delay: Time delay before it start.
    ///     - originTo: Desired point to translate origin to
    func translation(duration: TimeInterval = 1,
                   delay: TimeInterval = 0.0,
                   originTo: CGPoint,
                   completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: UIView.AnimationOptions.curveEaseIn,
                       animations: {
                    
                        // Distance from origin to point
                        let distance = self.originTo(point: originTo)
                        
                        // Translation delta
                        self.transform = CGAffineTransform(translationX: distance.x, y: distance.y + self.frame.height)

                       }, completion: completion)
    }
    /// Translates View By a Delta on Both Coordinates
    /// - Parameters:
    ///     - duration: Animation duration
    ///     - delay: Time delay before it start.
    ///     - delta: Desired delta to translate in each direction
    func translation(duration: TimeInterval = 1,
                   delay: TimeInterval = 0.0,
                   delta: CGPoint,
                   completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: UIView.AnimationOptions.curveEaseIn,
                       animations: {

                        // Translation by a delta
                        self.transform = CGAffineTransform(translationX: delta.x, y: delta.y)

                       }, completion: completion)
    }
    /// Scales the View by a Factor
    /// - Parameters:
    ///     - duration: Animation duration
    ///     - delay: Time delay before it start.
    ///     - scaleX: Scale faction in X direction
    ///     - scaleY: Scale faction in Y direction
    func scaleBy(duration: TimeInterval = 1,
                   delay: TimeInterval = 0.0,
                   scaleX: CGFloat = 1,
                   scaleY: CGFloat = 1,
                   completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: UIView.AnimationOptions.curveEaseIn,
                       animations: {

                        //  Scale by
                        self.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)

                       }, completion: completion)
    }
    /// Returns view to it's initial state
    /// - Parameters:
    ///     - duration: Animation duration
    ///     - delay: Time delay before it start.
    func identity(duration: TimeInterval = 1,
                   delay: TimeInterval = 0.0,
                   completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: UIView.AnimationOptions.curveEaseIn,
                       animations: {

                        // Reset to identity
                        self.transform = CGAffineTransform.identity

                       }, completion: completion)
    }
}
