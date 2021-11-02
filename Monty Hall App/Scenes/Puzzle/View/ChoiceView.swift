//
//  ChoiceView.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 30/10/21.
//

import UIKit

/// Choice View
/// Contais keep and swith buttons
class ChoiceView: UIView {
    /// Keep choice button
    let keepChoice = AssetView(.choice, subView: UIButton())
    /// Switch choice button
    let switchChoice = AssetView(.choice, subView: UIButton())
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    /// Adds constraints to keep choice - Hierarchy 1.
    fileprivate func keepChoiceConstraints() {
        keepChoice.translatesAutoresizingMaskIntoConstraints = false
        keepChoice.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        keepChoice.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        keepChoice.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45).isActive = true
        keepChoice.heightAnchor.constraint(equalTo: keepChoice.widthAnchor).isActive = true
    }
    /// Adds constraints to switch choice - Hierarchy 2.
    fileprivate func switchChoiceConstraints() {
        switchChoice.translatesAutoresizingMaskIntoConstraints = false
        switchChoice.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        switchChoice.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        switchChoice.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45).isActive = true
        switchChoice.heightAnchor.constraint(equalTo: switchChoice.widthAnchor).isActive = true
    }
    /// Setups UI
    fileprivate func setupUI() {
        /// Hierarchy 1 - Keep Choice.
        self.addSubview(keepChoice)
        keepChoiceConstraints()
        keepChoice.subView.setTitle("Keep", for: .normal)
        keepChoice.subView.setTitleColor(.mGray, for: .normal)
        keepChoice.subView.titleLabel?.font = UIFont(name: "PhosphateRRSolid", size: 25)
        keepChoice.subView.titleLabel?.textAlignment = .center
        /// Hierarchy 2 - Switch Choice.
        self.addSubview(switchChoice)
        switchChoiceConstraints()
        switchChoice.subView.setTitle("Switch", for: .normal)
        switchChoice.subView.setTitleColor(.mGray, for: .normal)
        switchChoice.subView.titleLabel?.font = UIFont(name: "PhosphateRRSolid", size: 25)
        switchChoice.subView.titleLabel?.textAlignment = .center
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
