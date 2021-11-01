//
//  PuzzleUserInterface.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 16/02/21.
//

import UIKit

/// Puzzle View
class PuzzleView: UIView {
    /// Door collection view
    let collection = DoorCollectionView()
    /// Keep choice button
    let choice = ChoiceView()
    /// Result label
    let panel = Panel()
    /// Reset
    let reset = UIButton()
    /// Vertical spacing constant
    let space = UIScreen.main.bounds.height*0.03
    /// Initializes a Puzzle View
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    /// Adds constraints to collection view - Hierarchy 1.
    fileprivate func collectionViewContraints() {
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        collection.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        collection.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.95).isActive = true
        collection.heightAnchor.constraint(equalTo: collection.widthAnchor, multiplier: 0.6).isActive = true
    }
    /// Adds constraints to results - Hierarchy 2.
    fileprivate func panelConstraints() {
        panel.translatesAutoresizingMaskIntoConstraints = false
        panel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        panel.topAnchor.constraint(equalTo: self.topAnchor, constant: space).isActive = true
        panel.bottomAnchor.constraint(equalTo: collection.topAnchor, constant: -space).isActive = true
        panel.widthAnchor.constraint(equalTo: panel.heightAnchor, multiplier: 1.65).isActive = true
    }
    /// Adds constraints to results - Hierarchy 3.
    fileprivate func choiceConstraints() {
        choice.translatesAutoresizingMaskIntoConstraints = false
        choice.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        choice.topAnchor.constraint(equalTo: collection.bottomAnchor).isActive = true
        choice.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
        choice.widthAnchor.constraint(equalTo: choice.heightAnchor, multiplier: 2.5).isActive = true
    }

    /// Adds constraints to restart - Hierarchy 4.
    fileprivate func resetConstraints() {
        reset.translatesAutoresizingMaskIntoConstraints = false
        reset.bottomAnchor.constraint(equalTo: collection.topAnchor).isActive = true
        reset.rightAnchor.constraint(equalTo: collection.rightAnchor).isActive = true
        reset.heightAnchor.constraint(equalTo: choice.heightAnchor).isActive = true
        reset.widthAnchor.constraint(equalTo: reset.heightAnchor).isActive = true
    }
    /// Setups UI
    func setupUI() {
        /// Hierarchy 1 - Collection View.
        self.addSubview(collection)
        collectionViewContraints()
        /// Hierarchy 2 - Result.
        self.addSubview(panel)
        panelConstraints()
        /// Hierarchy 3 - Keep Choice.
        self.addSubview(choice)
        choiceConstraints()
        /// Hierarchy 4 - Restart.
        self.addSubview(reset)
        resetConstraints()
        reset.backgroundColor = .gray
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

