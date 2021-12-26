//
//  LeverView.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 26/12/21.
//

import UIKit
import Foundation

/// Lever View that triggers a experiment
class LeverView: UIView {
    /// Rail where the lever runs
    let rail = AssetView(.rail, subView: UIView())
    /// Lever
    let lever = AssetView(.lever, subView: UIView())
    /// Initializes a lever view
    init() {
        super.init(frame: .zero)
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
