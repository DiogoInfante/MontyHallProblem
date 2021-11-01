//
//  ResultLabel.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 30/10/21.
//

import UIKit

class Panel: AssetView<UILabel> {
    init(_ asset: Asset = .panel) {
        super.init(asset, subView: UILabel())
    }
    /// Set label layout
    /// - Parameters:
    ///     - didWin: Indicates if player won the prize
    
    func end(didWin: Bool) {
        if didWin {
            self.subView.text = "Win!"
        }
        else {
            self.subView.text = "Lost"
        }
    }
    /// Resets label to initial state
    func reset() {
        self.subView.text = "First Choice"
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
