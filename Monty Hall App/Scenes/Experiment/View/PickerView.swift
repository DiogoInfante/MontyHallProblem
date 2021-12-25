//
//  Picker.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 25/12/21.
//

import UIKit
import Foundation

/// Picker View
class PickerView: AssetView<UIView> {
    /// UI Picker View
    let uiPicker = UIPickerView()
    /// Cell symbol
    let symbol: AssetView<UIView>
    /// Initializes a picker view
    init(_ asset: Asset) {
        self.symbol = AssetView(asset, subView: UIView())
        super.init(.picker, subView: UIView())
    }
    /// Adds constraints to uiPicker - Hierarchy 1.
    fileprivate func uiPickerConstraints() {
        uiPicker.translatesAutoresizingMaskIntoConstraints = false
        uiPicker.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        uiPicker.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        uiPicker.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.66).isActive = true
        uiPicker.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    /// Adds constraints to symbol - Hierarchy 2.
    fileprivate func symbolConstraints() {
        symbol.translatesAutoresizingMaskIntoConstraints = false
        symbol.leftAnchor.constraint(equalTo: uiPicker.leftAnchor).isActive = true
        symbol.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        symbol.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        symbol.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.66).isActive = true
        symbol.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        symbol.contentMode = .scaleAspectFit
    }
    /// Setups UI
    func setupUI() {
        /// Hierarchy 1 - Panel.
        self.addSubview(uiPicker)
        uiPickerConstraints()
        /// HIerarchy 2 - Symbol
        self.addSubview(symbol)
        symbolConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
