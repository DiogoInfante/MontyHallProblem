//
//  ExperimentView.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 01/11/21.
//

import UIKit

/// Experiment View
class ExperimentView: NavegationView {
    /// Panel view
    let panel = PanelView()
    /// Picker stack
    let pickerStack = AssetView(.experimentBoard, subView: UIStackView(), 0.7)
    /// Picker stacks cells
    let cells = [PickerView(.numberOfDoors),
                 PickerView(.secondChoice),
                 PickerView(.repetitions)]
    /// Bottom
    let bottom = LeverView()
    /// Vertical spacing constant
    let space = UIScreen.main.bounds.height*0.03
    /// Initializes a experiment view
    init() {
        super.init()
        setupUI()
    }
    /// Adds constraints to panel - Hierarchy 1.
    fileprivate func panelConstraints() {
        panel.translatesAutoresizingMaskIntoConstraints = false
        panel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        panel.topAnchor.constraint(equalTo: self.topBar.bottomAnchor).isActive = true
        panel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        panel.heightAnchor.constraint(equalTo: panel.widthAnchor, multiplier: 0.6).isActive = true
    }
    /// Adds constraints to bottom - Hierarchy 2.
    fileprivate func bottomConstraints() {
        bottom.translatesAutoresizingMaskIntoConstraints = false
        bottom.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bottom.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -space/2).isActive = true
        bottom.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        bottom.heightAnchor.constraint(equalTo: panel.widthAnchor, multiplier: 0.2).isActive = true
    }
    /// Adds constraints to picker - Hierarchy 3.
    fileprivate func pickerStackConstraints() {
        pickerStack.translatesAutoresizingMaskIntoConstraints = false
        pickerStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pickerStack.topAnchor.constraint(equalTo: panel.bottomAnchor, constant: space).isActive = true
        pickerStack.bottomAnchor.constraint(equalTo: bottom.topAnchor, constant: -space).isActive = true
        pickerStack.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.83).isActive = true
    }
    /// Setups list stack view - Hierarchy 3.1.
    fileprivate func setupStack() {
        pickerStack.subView.isUserInteractionEnabled = true
        pickerStack.subView.alignment = .center
        pickerStack.subView.distribution = .equalSpacing
        pickerStack.subView.axis = .vertical
    }
    /// Adds constraints to cells - Hierarchy 3.2.
    fileprivate func cellsConstraints() {
        for cell in cells {
            pickerStack.subView.addArrangedSubview(cell)
            cell.translatesAutoresizingMaskIntoConstraints = false
            cell.heightAnchor.constraint(equalTo: pickerStack.subView.heightAnchor, multiplier: 0.3).isActive = true
            cell.widthAnchor.constraint(equalTo: cell.heightAnchor, multiplier: 2.7).isActive = true
        }
    }
    /// Setups UI
    func setupUI() {
        /// Hierarchy 1 - Panel.
        self.addSubview(panel)
        panelConstraints()
        /// HIerarchy 2 - bottom
        self.addSubview(bottom)
        bottomConstraints()
        /// Hierarchy 3 - Experiment Board.
        self.addSubview(pickerStack)
        pickerStackConstraints()
        setupStack()
        cellsConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
