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
    
    var door: Door {
        get {
            return _door
        }
        set {
            _door = newValue
        }
    }
    
    func stateUpdated(_ newState: DoorState) {
        label.text = "Opa"
    }
    
   
    // Cell identifier
    static let identifier = "DoorCollectionViewCell"
    
    // Door View
    let doorView = UIImageView()
    
    // Behind View
    let behindView = UIImageView()
    
    // Door label
    let label = UILabel()
    
    // Tier 1 - Label constraints
    fileprivate func behindViewConstraints() {
        behindView.translatesAutoresizingMaskIntoConstraints = false
        behindView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        behindView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        behindView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        behindView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    }
    
    // Tier 2 - Label constraints
    fileprivate func doorViewConstraints() {
        doorView.translatesAutoresizingMaskIntoConstraints = false
        doorView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        doorView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        doorView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        doorView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    }
    
    // Tier 3 - Label constraints
    fileprivate func labelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Background
        contentView.backgroundColor = .gray
        
        // Behind view setup
        contentView.addSubview(behindView)
        behindViewConstraints()
        
        // Door view setup
        contentView.addSubview(doorView)
        doorViewConstraints()
        
        doorView.image = UIImage(named: "Door")
        
        // Label setup
        contentView.addSubview(label)
        labelConstraints()
        
    }
    
    // Label text setup
    func setDoorLabelNumber(_ doorNumber: Int) {
        label.text = String(doorNumber)
        label.textAlignment = .center
    }
    
    // Debug label text setup
    func debugDoor(_ door: Door) {
        label.text = ("\(door.id) \(door.isPrized)")
        label.textAlignment = .center
    }

    // Prize door setup
    func prizeDoorSetup() {
        behindView.image = UIImage(named: "FerrariDoor")
    }
    
    // Goat door setup
    func goatDoorSetup() {
        behindView.image = UIImage(named: "GoatDoor")
    }
    
    // Open door
    func openDoor() {
        doorView.alpha = 0
        label.alpha = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
