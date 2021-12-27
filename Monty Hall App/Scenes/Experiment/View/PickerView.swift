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
    /// Text Field
    let textField = UITextField()
    /// Cell symbol
    var symbol =  AssetView()
    /// Picker type
    let type: PickerType
    /// Initializes a picker view
    init(_ type: PickerType) {
        self.type = type
        super.init(.picker, subView: UIView())
        textField.inputView = uiPicker
        setupPicker()
        setupUI()
    }
    /// Adds constraints to uiPicker - Hierarchy 1.
    fileprivate func uiPickerConstraints() {
        uiPicker.translatesAutoresizingMaskIntoConstraints = false
        uiPicker.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        uiPicker.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        uiPicker.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.62).isActive = true
        uiPicker.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    /// Adds constraints to symbol - Hierarchy 2.
    fileprivate func symbolConstraints() {
        symbol.translatesAutoresizingMaskIntoConstraints = false
        symbol.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        symbol.leftAnchor.constraint(equalTo: uiPicker.rightAnchor, constant: 10).isActive = true
        symbol.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        symbol.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.66).isActive = true
        symbol.contentMode = .scaleAspectFit
    }
    /// Setups Picker
    fileprivate func setupPicker() {
        switch type {
        case .numberOfDoors:
            self.symbol = AssetView(.doorSymbol, subView: UIView())
        case .secondChoice:
            self.symbol = AssetView(.shuffleSymbol, subView: UIView())
        case .repetitions:
            self.symbol = AssetView(.repeatSymbol, subView: UIView())
        }
    }
    /// Setups UI
    func setupUI() {
        /// Hierarchy 1 - uiPicker.
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
