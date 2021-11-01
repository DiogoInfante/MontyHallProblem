//
//  MenuView.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 01/11/21.
//

import UIKit

/// Menu View
/// It's a menu that navigates in between pages by clicking on arrows
class MenuView: UIView {
    /// Action button to push a VC
    let button = AssetView(.play, subView: UIButton())
    /// Next option of action button
    let nextArrow = AssetView(.next, subView: UIButton())
    /// Last option of action button
    let backArrow = AssetView(.back, subView: UIButton())
    /// Horizontal space
    let space = UIScreen.main.bounds.width*0.05
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    /// Adds constraints to button - Hierarchy 1.
    fileprivate func buttonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.625).isActive = true
        button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true
    }
    /// Adds constraints to last item - Hierarchy 2.
    fileprivate func lastItemConstraints() {
        backArrow.translatesAutoresizingMaskIntoConstraints = false
        backArrow.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        backArrow.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        backArrow.rightAnchor.constraint(equalTo: button.leftAnchor).isActive = true
        backArrow.heightAnchor.constraint(equalTo: backArrow.widthAnchor).isActive = true
    }
    /// Adds constraints to next item - Hierarchy 3.
    fileprivate func nextItemConstraints() {
        nextArrow.translatesAutoresizingMaskIntoConstraints = false
        nextArrow.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        nextArrow.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        nextArrow.leftAnchor.constraint(equalTo: button.rightAnchor).isActive = true
        nextArrow.heightAnchor.constraint(equalTo: nextArrow.widthAnchor).isActive = true
    }
    /// Called when last or next were pressed
    /// - Parameters:
    ///      - id: identifies which button is currently pressed
    func didSelect(_ id: Int) {
        /// Play button (id 0)
        if id == 0 {
            button.update(.play)
            backArrow.disappear()
        /// Experiment button (id 1)
        } else if id == 1 {
            button.update(.experiment)
            backArrow.appear()
            nextArrow.appear()
        }
        /// Book button (id 2)
        else {
            button.update(.book)
            nextArrow.disappear()
        }
    }
    /// Setups UI
    fileprivate func setupUI() {
        /// Hierarchy 1 - Button.
        self.addSubview(button)
        buttonConstraints()
        /// Hierarchy 2 - Last item.
        self.addSubview(backArrow)
        lastItemConstraints()
        /// Hierarchy 3 - Last item.
        self.addSubview(nextArrow)
        nextItemConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
