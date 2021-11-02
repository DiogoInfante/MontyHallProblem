//
//  TutorialVC.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 01/11/21.
//

import UIKit

/// Tutorial View Controller
/// This page explains the solution to monty hall problem
class TutorialVC: BaseViewController<NavegationView> {
    /// Initializes a TutorialVC.
    init() {
        super.init(scene: TutorialView())
    }
    /// View did load cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Background
        self.contentView.update(.smoothBackground)
        /// Scene setup
        view.addSubview(scene)
        scene.setScene(root: contentView)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
