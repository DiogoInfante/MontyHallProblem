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
    let keepChoice = UIButton()
    /// Switch choice button
    let switchChoice = UIButton()
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    /// Adds constraints to keep choice - Hierarchy 1.
    fileprivate func keepChoiceConstraints() {
        keepChoice.translatesAutoresizingMaskIntoConstraints = false
        keepChoice.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        keepChoice.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        keepChoice.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        keepChoice.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
    }
    /// Adds constraints to switch choice - Hierarchy 2.
    fileprivate func switchChoiceConstraints() {
        switchChoice.translatesAutoresizingMaskIntoConstraints = false
        switchChoice.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        switchChoice.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        switchChoice.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        switchChoice.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
    }
    /// Setups UI
    fileprivate func setupUI() {
        /// Hierarchy 1 - Keep Choice.
        self.addSubview(keepChoice)
        keepChoiceConstraints()
        keepChoice.backgroundColor = .blue
        keepChoice.setTitle("Keep", for: .normal)
        keepChoice.titleLabel?.textColor = .white
        /// Hierarchy 2 - Switch Choice.
        self.addSubview(switchChoice)
        switchChoiceConstraints()
        switchChoiceConstraints()
        switchChoice.backgroundColor = .gray
        switchChoice.setTitle("Switch", for: .normal)
        switchChoice.titleLabel?.textColor = .white
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
