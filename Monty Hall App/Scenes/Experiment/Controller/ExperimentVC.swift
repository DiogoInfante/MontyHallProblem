//
//  ExperimentVC.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 01/11/21.
//

import UIKit

/// Experiment View Controller
/// On this page is possible to simulate multiple cases of monty hall problem
class ExperimentVC: BaseViewController<ExperimentView> {
    /// Initializes a ExperimentVC.
    init() {
        super.init(scene: ExperimentView())
    }
    /// View did load cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Background
        self.contentView.update(.smoothBackground)
        /// Scene construction
        view.addSubview(scene)
        scene.setScene(root: view)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
