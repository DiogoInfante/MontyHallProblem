//
//  main.swift
//  Monty Hall Problem
//
//  Created by Diogo Infante on 15/02/21.
//

import UIKit
import Foundation

// MARK: Door Collection View Cell
class DoorCollectionViewCell: UICollectionViewCell, ObserverProtocol {
    private var _door = Door(-1)
    /// Automatically deals with the door content
    var door: Door {
        get {
            return _door
        }
        set {
            _door = newValue
            if door.isPrized {
                prizeDoorSetup()
            } else {
                goatDoorSetup()
            }
        }
    }
    /// Called by notification when the model is changed
    /// Updates door state visually by calling openDoor() or closeDoor()
    /// - Parameters:
    ///     - newState: New door state
    func stateUpdated(_ newState: DoorState) {
        switch newState {
        case .opened:
            openDoor()
        case .closed:
            closeDoor()
        }
    }
    /// Called by notification when the model is changed
    /// Updates prize content visually by calling prizeDoorSetup() or goatDoorSetup()
    /// - Parameters:
    ///     - isPrized: Boolean that tells if the door has a prize behind
    func prizeUpdated(_ isPrized: Bool) {
        isPrized ? prizeDoorSetup() : goatDoorSetup()
    }
    /// Cell identifier
    static let identifier = "DoorCollectionViewCell"
    /// Door
    let doorView = AssetView(.door)
    /// Behind View
    let behindView = AssetView(.goatDoor)
    /// label
    let label = UILabel()
    /// Adds constraints to behindView - Hierarchy 1.
    fileprivate func behindViewConstraints() {
        behindView.translatesAutoresizingMaskIntoConstraints = false
        behindView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        behindView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        behindView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        behindView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    }
    /// Adds constraints to door - Hierarchy 2.
    fileprivate func doorViewConstraints() {
        doorView.translatesAutoresizingMaskIntoConstraints = false
        doorView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        doorView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        doorView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        doorView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    }
    /// Adds constraints to label - Hierarchy 3.
    fileprivate func labelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        /// Hierarchy 1 - behind view.
        contentView.addSubview(behindView)
        behindViewConstraints()
        /// Hierarchy 2 - door.
        contentView.addSubview(doorView)
        doorViewConstraints()
        /// Hierarchy 3 - label.
        contentView.addSubview(label)
        labelConstraints()
    }
    /// Label text setup
    /// - Parameters: doorNumber
    func setDoorNumber(_ doorNumber: Int) {
        label.text = String(doorNumber)
        label.textAlignment = .center
    }
    /// Prize door setup
    private func prizeDoorSetup() {
        behindView.update(.carDoor)
    }
    /// Goat door setup
    private func goatDoorSetup() {
        behindView.update(.goatDoor)
    }
    /// Opens the door
    private func openDoor() {
        doorView.alpha = 0
        label.alpha = 0
    }
    /// Closes the door
    private func closeDoor() {
        doorView.alpha = 1
        label.alpha = 1
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
