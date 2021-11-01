//
//  ResultLabel.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 30/10/21.
//

import UIKit

/// Panel View
/// Panel that instructs the interaction and displays the score
/// It contains a label as subView form assetView
class PanelView: AssetView<UILabel> {
    /// Initializes a panel view
    init(_ asset: Asset = .panel) {
        super.init(asset, subView: UILabel())
        self.subView.textAlignment = .center
        self.subView.textColor = .yellow
        self.subView.numberOfLines = 2
    }
    /// Update panel display to ask for second choice
    /// - Parameters
    ///     - openIds: List with open doors ids: This id goes from 0 to count-1
    ///     - choosenId: Choosen door id: : This id goes from 0 to count-1
    ///     - switchId: Choosen door id: This id goes from 0 to count-1
    func askForSecondChoice(openIds: [Int], chosendId: Int, switchId: Int) {
        let openString = openIds.increment(1).getString()
        var string = "doors \(openString) has goats"
        if openIds.count == 1 {
            string = "door \(openString) has a goat"
        }
        self.subView.text = "\(string) \nKeep on \(chosendId+1) or switch to \(switchId+1)?"
    }
    /// Set label layout
    /// - Parameters:
    ///     - didWin: Indicates if player won the prize
    ///     - results: Contain results history
    func displayResults(didWin: Bool, results: Results) {
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
