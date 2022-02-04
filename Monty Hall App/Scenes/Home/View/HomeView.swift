//
//  HomeView.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 31/10/21.
//

import UIKit

/// Home View
class HomeView: NavigationView {
    /// Banner with app title
    let banner = AssetView(.banner)
    /// Seleciton Menu
    let menu = MenuView()
    /// Goat image
    let goat = AssetView(.goat)
    /// Car image
    let car = AssetView(.car)
    /// Vertical spacing
    let space = UIScreen.main.bounds.height*0.03
    /// Initializes a Home View
    init() {
        super.init(isRoot: true)
        setupUI()
    }
    /// Adds constraints to menu - Hierarchy 1.
    fileprivate func menuContraints() {
        menu.translatesAutoresizingMaskIntoConstraints = false
        menu.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        menu.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        menu.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45).isActive = true
        menu.widthAnchor.constraint(equalTo: menu.heightAnchor, multiplier: 1.47).isActive = true
    }
    /// Adds constraints to banner - Hierarchy 2.
    fileprivate func bannerConstraints() {
        banner.translatesAutoresizingMaskIntoConstraints = false
        banner.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        banner.topAnchor.constraint(equalTo: self.topBar.bottomAnchor).isActive = true
        banner.bottomAnchor.constraint(equalTo: menu.topAnchor, constant: -space).isActive = true
        banner.widthAnchor.constraint(equalTo: banner.heightAnchor, multiplier: 1.33).isActive = true
    }
    /// Adds constraints to car - Hierarchy 3.
    fileprivate func carConstraints() {
        car.translatesAutoresizingMaskIntoConstraints = false
        car.topAnchor.constraint(equalTo: menu.bottomAnchor, constant: space).isActive = true
        car.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -space).isActive = true
        car.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 5*space).isActive = true
        car.widthAnchor.constraint(equalTo: car.heightAnchor, multiplier: 1.82).isActive = true
    }
    /// Adds constraints to goat - Hierarchy 4.
    fileprivate func goatConstraints() {
        goat.translatesAutoresizingMaskIntoConstraints = false
        goat.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45).isActive = true
        goat.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -space).isActive = true
        goat.leftAnchor.constraint(equalTo: self.leftAnchor, constant: -2*space).isActive = true
        goat.widthAnchor.constraint(equalTo: goat.heightAnchor, multiplier: 0.82).isActive = true
    }
    /// Setups UI
    func setupUI() {
        /// Hierarchy 1 - menu.
        self.addSubview(menu)
        menuContraints()
        /// Hierarchy 2 - banner.
        self.addSubview(banner)
        bannerConstraints()
        /// Hierarchy 3 - car.
        self.addSubview(car)
        carConstraints()
        /// Hierarchy 4 - goat.
        self.addSubview(goat)
        goatConstraints()
        goat.rotate(angle: -12)
        /// Rearrange subsviews
        self.bringSubviewToFront(menu)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
