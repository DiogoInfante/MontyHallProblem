//
//  ResultLabel.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 30/10/21.
//

import UIKit

class PanelView: AssetView<UILabel> {
    init(_ asset: Asset = .panel) {
        super.init(asset, subView: UILabel())
        self.subView.textAlignment = .center
        self.subView.textColor = .yellow
        self.subView.numberOfLines = 2
    }
    func secondChoice(openIds: [Int], chosendId: Int, switchId: Int) {
        var stringDoor = "doors has goats"
        if openIds.count == 1 {
            stringDoor = "door has a goat"
        }
        self.subView.text = "\(openIds) \(stringDoor)\nKeep \(chosendId) or switch to \(switchId)?"
    }
    /// Set label layout
    /// - Parameters:
    ///     - didWin: Indicates if player won the prize
    func end(didWin: Bool, results: Results) {
        var lastResult: String = "You've Lost..."
        if didWin {
            lastResult = "You've Won!"
        }
        self.subView.text = "\(lastResult)\n Wins:\(results.wins) | rounds: \(results.rounds) | rate: \(Int(results.winningRate*100))%"
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
