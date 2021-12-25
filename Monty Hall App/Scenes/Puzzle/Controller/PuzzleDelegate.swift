//
//  PuzzleDelegate.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 25/12/21.
//

import UIKit
import Foundation

/// Puzzle Delegate conforms to all delegate protocols needed on the PuzzleVC
/// SubProtocols:
///    - UICollectionViewDelegate: Collection view delegate
///    - UICollectionViewDataSource: Collection data source
///    - StateObserver: State machine observer
protocol PuzzleDelegate: UICollectionViewDelegate, UICollectionViewDataSource, StateObserver {
    var scene: PuzzleView { get set }
    var stateMachine: StateMachine { get set }
    func set(delegate: PuzzleDelegate)
}
extension PuzzleDelegate {
    func set(delegate: PuzzleDelegate) {
        stateMachine.delegate = self
        scene.collection.delegate = self
        scene.collection.dataSource = self
    }
}
