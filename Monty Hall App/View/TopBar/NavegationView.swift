//
//  NavagationView.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 02/11/21.
//

import UIKit

/// Navegation View is a View that intrinsically has a top bar view
/// If it's the root view, the back button disappears
class NavegationView: UIView {
    /// Indicates if the view is a root view
    let isRoot: Bool
    /// Instatiates a top bar
    lazy var topBar = TopBarView(root: isRoot)
    /// Initializes a navegation view
    init(isRoot: Bool = false) {
        self.isRoot = isRoot
        super.init(frame: .zero)
        
        self.addSubview(topBar)
        topBarConstraints()
    }
    /// Adds constraints to top bar - Hierarchy 0.
    fileprivate func topBarConstraints() {
        topBar.translatesAutoresizingMaskIntoConstraints = false
        topBar.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        topBar.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        topBar.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05).isActive = true
        topBar.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
