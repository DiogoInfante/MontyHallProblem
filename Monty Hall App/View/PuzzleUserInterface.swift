//
//  PuzzleUserInterface.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 16/02/21.
//

// MARK: - Puzzle View Controller User Interface Extensions
extension PuzzleViewController {
    
    // Tier 1 - Door collection view constraints
    fileprivate func doorCollectionViewContraints() {
        doorCollectionView.translatesAutoresizingMaskIntoConstraints = false
        doorCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        doorCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        doorCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        doorCollectionView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.3).isActive = true
    }

    // Tier 2 - Keep choice button constraints
    fileprivate func keepChoiceButtonConstraints() {
        keepChoiceButton.translatesAutoresizingMaskIntoConstraints = false
        keepChoiceButton.topAnchor.constraint(equalTo: doorCollectionView.bottomAnchor).isActive = true
        keepChoiceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50).isActive = true
        keepChoiceButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        keepChoiceButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    // Tier 3 - Switch choice button constraints
    fileprivate func switchChoiceButtonConstraints() {
        switchChoiceButton.translatesAutoresizingMaskIntoConstraints = false
        switchChoiceButton.topAnchor.constraint(equalTo: doorCollectionView.bottomAnchor).isActive = true
        switchChoiceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50).isActive = true
        switchChoiceButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        switchChoiceButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    // Tier 4 - Switch choice button constraints
    fileprivate func resultLabelConstraints() {
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.leftAnchor.constraint(equalTo: keepChoiceButton.leftAnchor).isActive = true
        resultLabel.rightAnchor.constraint(equalTo: switchChoiceButton.rightAnchor).isActive = true
        resultLabel.heightAnchor.constraint(equalTo: switchChoiceButton.heightAnchor).isActive = true
        resultLabel.centerYAnchor.constraint(equalTo: switchChoiceButton.centerYAnchor).isActive = true
    }
    
    // Setup view properties
    func setupViewProperties() {
        
        // Tier 1 - Door collection view
        view.addSubview(doorCollectionView)
        doorCollectionViewContraints()
    
        doorCollectionView.backgroundColor = .cyan
        
        // Tier 2 - Keep choice button
        view.addSubview(keepChoiceButton)
        keepChoiceButtonConstraints()
        
        keepChoiceButton.backgroundColor = .blue
        keepChoiceButton.setTitle("Keep", for: .normal)
        keepChoiceButton.titleLabel?.textColor = .white
        
        // Tier 3 - Keep choice button
        view.addSubview(switchChoiceButton)
        switchChoiceButtonConstraints()
        
        switchChoiceButton.backgroundColor = .gray
        switchChoiceButton.setTitle("Switch", for: .normal)
        switchChoiceButton.titleLabel?.textColor = .white
        
        // Tier 4 - Result label
        view.addSubview(resultLabel)
        resultLabelConstraints()
    }
    
    // Set label layout
    func labelLayout(didWin: Bool) {
        if didWin {
            resultLabel.text = "Win!"
            resultLabel.backgroundColor = .green
        }
        else {
            resultLabel.text = "Lost"
            resultLabel.backgroundColor = .systemRed
        }
        resultLabel.textColor = .white
        resultLabel.textAlignment = .center
    }
}

