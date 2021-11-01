//
//  MenuView.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 01/11/21.
//

import UIKit

class MenuView: UIView {
    /// Keep choice button
    let button = AssetView(.play, subView: UIButton())
    /// Next
    let nextItem = AssetView(.next, subView: UIButton())
    /// Switch choice button
    let lastItem = AssetView(.back, subView: UIButton())
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
        lastItem.translatesAutoresizingMaskIntoConstraints = false
        lastItem.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        lastItem.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        lastItem.rightAnchor.constraint(equalTo: button.leftAnchor).isActive = true
        lastItem.heightAnchor.constraint(equalTo: lastItem.widthAnchor).isActive = true
    }
    /// Adds constraints to next item - Hierarchy 3.
    fileprivate func nextItemConstraints() {
        nextItem.translatesAutoresizingMaskIntoConstraints = false
        nextItem.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        nextItem.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        nextItem.leftAnchor.constraint(equalTo: button.rightAnchor).isActive = true
        nextItem.heightAnchor.constraint(equalTo: nextItem.widthAnchor).isActive = true
    }
    func didSelect(_ id: Int) {
        if id == 0 {
            button.update(.play)
            lastItem.disappear()
        } else if id == 1 {
            button.update(.experiment)
            lastItem.appear()
            nextItem.appear()
        }
        else {
            button.update(.book)
            nextItem.disappear()
        }
    }
    /// Setups UI
    fileprivate func setupUI() {
        /// Hierarchy 1 - Button.
        self.addSubview(button)
        buttonConstraints()
        /// Hierarchy 2 - Last item.
        self.addSubview(lastItem)
        lastItemConstraints()
        /// Hierarchy 3 - Last item.
        self.addSubview(nextItem)
        nextItemConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
