//
//  ExperimentDelegate.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 25/12/21.
//

import UIKit
import Foundation

/// Experiment Delegate conforms to all delegate protocols needed on the ExperimentVC
/// SubProtocols:
///    - UIPickerViewDelegate: Picker view delegate
///    - UIPickerViewDataSource: Picker view data source
protocol ExperimentDelegate: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    var scene: ExperimentView { get set }
    func set(delegate: ExperimentDelegate)
}
extension ExperimentDelegate {
    func set(delegate: ExperimentDelegate) {
        for cell in scene.cells {
            cell.uiPicker.delegate = self
            cell.uiPicker.dataSource = self
            cell.textField.delegate = self
        }
    }
}
