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
    let panel = PanelView()
    /// Stage
    let stage = AssetView(.stage)
    /// Reset
    let reset = AssetView(.playAgain, subView: UIButton())
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
    /// Adds constraints to stage - Hierarchy 3.
    fileprivate func stageConstraints() {
        stage.translatesAutoresizingMaskIntoConstraints = false
        stage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stage.topAnchor.constraint(equalTo: collection.bottomAnchor, constant: -5).isActive = true
        stage.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        stage.heightAnchor.constraint(equalTo: stage.widthAnchor, multiplier: 0.27).isActive = true
    }
    /// Adds constraints to results - Hierarchy 4.
    fileprivate func choiceConstraints() {
        choice.translatesAutoresizingMaskIntoConstraints = false
        choice.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        choice.topAnchor.constraint(equalTo: stage.bottomAnchor, constant: space).isActive = true
        choice.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -space).isActive = true
        choice.widthAnchor.constraint(equalTo: choice.heightAnchor, multiplier: 2).isActive = true
    }

    /// Adds constraints to restart - Hierarchy 5.
    fileprivate func resetConstraints() {
        reset.translatesAutoresizingMaskIntoConstraints = false
        reset.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        reset.centerYAnchor.constraint(equalTo: choice.centerYAnchor).isActive = true
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
        /// Hierarchy 4 - Stage.
        self.addSubview(stage)
        stageConstraints()
        /// Hierarchy 3 - Keep Choice.
        self.addSubview(choice)
        choiceConstraints()
        choice.disappear()
        /// Hierarchy 4 - Restart.
        self.addSubview(reset)
        resetConstraints()
        reset.disappear()
        /// Start state
        waitingForFirstChoice()
    }
    /// Waiting For First Choice UI Updates
    func waitingForFirstChoice() {
        reset.fadeOut()
        panel.subView.text = "Tap to choose a door"
    }
    /// Waiting For First Second UI Updates
    func waitingForSecondChoice() {
        choice.fadeIn()
        panel.subView.text = "Do you want to keep your choice or switch to:"
    }
    /// Ended UI Updates
    func ended() {
        choice.fadeOut()
        reset.fadeIn()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

