//
//  Asset.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 30/10/21.
//

import UIKit

/// As Coinks has many assets this enum lists every asset used on the app
/// This enum is a string typed so the asset name is equal to the case
/// There is a get static function to get a UIImage from the asset and handle nil case
enum Asset: String {
    /// Empty
    case empty
    // MARK: - Common
    /// Backgrounds
    case background
    case smoothBackground
    /// Main
    case goat
    case car
    /// Others
    case yes
    case no
    // MARK: - Scenes
    /// Home Scene
    case banner
    case play
    case experiment
    /// Puzzle Scene
    case back
    case choice
    case playAgain
    case panel
    case stage
    case door
    case carDoor
    case goatDoor
    // MARK: - Methods
    /// Gets an UIImage from given asset if it's a valid one.
    /// - Parameters:
    ///     - asset: A case from Assets enum that is also the image name
    /// - Returns:
    ///     - A UIImage from the given asset
    static func get(_ asset: Asset) -> UIImage {
        guard let image = UIImage(named: asset.rawValue) else {
            return UIImage()
        }
        return image
    }
}
