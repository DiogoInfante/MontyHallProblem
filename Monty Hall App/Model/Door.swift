//
//  Door.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 17/02/21.
//

import Foundation

/// Oberserver Protocol
protocol ObserverProtocol: AnyObject {
    func stateUpdated(_ newState: DoorState)
}
/// Door Model: Subject
class Door {
    /// id
    let id: Int
    /// State: Initializes closed
    private var _state: DoorState = .closed
    /// Update state with observer
    var state : DoorState {
        get {
            return _state
        }
        set {
            _state = newValue
            notifyObserver()
        }
    }
    /// Indicates if the door is prized
    var isPrized: Bool
    /// Initializes a Door
    /// - Parameters: id: Door id
    init(_ id: Int) {
        self.id = id
        self.isPrized = false
    }
    /// Set door as prized
    func setAsPrized() {
        self.isPrized = true
    }
    /// Observer
    weak var observer: ObserverProtocol?
    /// Notification
    private func notifyObserver() {
        observer?.stateUpdated(_state)
    }
}
/// Doors States
enum DoorState {
    case opened
    case closed
    /// Toggle function changes a coord state
    mutating func toggle() {
        self = self == .opened ? .closed : .opened
    }
}
