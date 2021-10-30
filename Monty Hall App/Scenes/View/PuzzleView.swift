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
    let collectionView = DoorCollectionView()
    /// Keep choice button
    let choice = ChoiceView()
    /// Result label
    let result = UILabel()
    /// Restart
    let restart = UIButton()
    /// Initializes a Puzzle View
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    /// Adds constraints to collection view - Hierarchy 1.
    fileprivate func collectionViewContraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor).isActive = true
    }
    /// Adds constraints to results - Hierarchy 2.
    fileprivate func choiceConstraints() {
        choice.translatesAutoresizingMaskIntoConstraints = false
        choice.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        choice.topAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
        choice.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
        choice.widthAnchor.constraint(equalTo: choice.heightAnchor, multiplier: 2.5).isActive = true
    }
    /// Adds constraints to results - Hierarchy 3.
    fileprivate func resultConstraints() {
        result.constraint(to: choice)
    }
    /// Adds constraints to restart - Hierarchy 4.
    fileprivate func restartConstraints() {
        restart.translatesAutoresizingMaskIntoConstraints = false
        restart.bottomAnchor.constraint(equalTo: collectionView.topAnchor).isActive = true
        restart.rightAnchor.constraint(equalTo: collectionView.rightAnchor).isActive = true
        restart.heightAnchor.constraint(equalTo: choice.heightAnchor).isActive = true
        restart.widthAnchor.constraint(equalTo: restart.heightAnchor).isActive = true
    }
    /// Setups UI
    func setupUI() {
        /// Hierarchy 1 - Collection View.
        self.addSubview(collectionView)
        collectionViewContraints()
        collectionView.backgroundColor = .cyan
        /// Hierarchy 2 - Keep Choice.
        self.addSubview(choice)
        choiceConstraints()
        /// Hierarchy 3 - Result.
        self.addSubview(result)
        resultConstraints()
        /// Hierarchy 4 - Restart.
        self.addSubview(restart)
        restartConstraints()
        restart.backgroundColor = .gray
    }
    /// Set label layout
    /// - Parameters:
    ///     - didWin: Indicates if player won the prize
    func updateLabel(didWin: Bool) {
        if didWin {
            result.text = "Win!"
            result.backgroundColor = .green
        }
        else {
            result.text = "Lost"
            result.backgroundColor = .systemRed
        }
        result.textColor = .white
        result.textAlignment = .center
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

