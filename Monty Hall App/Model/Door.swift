//
//  Door.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 17/02/21.
//

import Foundation

// MARK: - Oberserver Protocol
protocol ObserverProtocol: class {
    func stateUpdated(_ newState: DoorState)
}

// MARK: - Door Model: Subject
class Door {
    
    let id: Int
    
    private var _state: DoorState = .closed
    
    var state : DoorState {
        get {
            return _state
        }
        set {
            _state = newValue
            notifyObserver()
        }
    }
    
    var isPrized: Bool
    
    init(_ id: Int) {
        self.id = id
        self.isPrized = false
    }
    
    func setAsPrized() {
        self.isPrized = true
    }
    
    weak var observer: ObserverProtocol?
    
    private func notifyObserver() {
        observer?.stateUpdated(_state)
    }
}

enum DoorState {
    case opened
    case closed

    mutating func toggle() {
        self = self == .opened ? .closed : .opened
    }
}
