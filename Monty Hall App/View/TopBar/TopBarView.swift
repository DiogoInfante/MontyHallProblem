//
//  TopBar.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 02/11/21.
//

import UIKit

/// Top Bar View
/// It's a menu that navigates in between pages by clicking on arrows
class TopBarView: UIView {
    /// Last option of action button
    let pop = AssetView(.pop, subView: UIButton())
    /// Next option of action button
    let sound = AssetView(.discoOn, subView: UIButton())
    /// Horizontal space
    let space = UIScreen.main.bounds.width*0.025
    /// Initializes a top bar view
    init(root: Bool = false) {
        if root {
            pop.disappear()
        }
        super.init(frame: .zero)
        setupUI()
    }
    /// Adds constraints to last item - Hierarchy 1.
    fileprivate func popConstraints() {
        pop.translatesAutoresizingMaskIntoConstraints = false
        pop.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        pop.leftAnchor.constraint(equalTo: self.leftAnchor, constant: space).isActive = true
        pop.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        pop.widthAnchor.constraint(equalTo: pop.heightAnchor, multiplier: 0.95).isActive = true
    }
    /// Adds constraints to next item - Hierarchy 3.
    fileprivate func soundConstraints() {
        sound.translatesAutoresizingMaskIntoConstraints = false
        sound.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        sound.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -space).isActive = true
        sound.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        sound.widthAnchor.constraint(equalTo: sound.heightAnchor, multiplier: 1.12).isActive = true
    }
    /// Toggle disco icon according to soundtrack state
    /// - Parameters:
    ///     - isPlaying: Indicates if the music is playing
    func toggleDisco(_ isPlaying: Bool) {
        isPlaying ? sound.update(.discoOn) : sound.update(.discoOff)
    }
    /// Setups UI
    fileprivate func setupUI() {
        /// Hierarchy 1 - Pop.
        self.addSubview(pop)
        popConstraints()
        /// Hierarchy 2 - Soind.
        self.addSubview(sound)
        soundConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
