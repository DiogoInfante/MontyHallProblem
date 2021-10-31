//
//  DoorCollectionView.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 17/02/21.
//

import UIKit
import Foundation

/// Door Collection View
class DoorCollectionView: UICollectionView {
    /// Initializes a Door Collection View
    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        self.frame = .zero
        self.collectionViewLayout = collectionViewLayout()
        self.register(DoorCollectionViewCell.self, forCellWithReuseIdentifier: DoorCollectionViewCell.identifier)
    }
    /// Layout Properties
    func collectionViewLayout() -> UICollectionViewLayout {
        /// Dimensions
        let doorHeight: CGFloat = frame.height
        let doorWidth: CGFloat = doorHeight*0.51
        /// Screen size constant
        let screenSizeConstant: CGFloat = UIScreen.main.bounds.width/UIScreen.main.bounds.height*25
        /// Space constant
        let space: CGFloat = screenSizeConstant*4
        ///  Flow Layout
        let layout = UICollectionViewFlowLayout()
        /// Cell Dimensions
        let cellHeightConstant: CGFloat = screenSizeConstant*10
        let cellWidthConstant = cellHeightConstant*0.51
        /// Layout Properties
        layout.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = space
        layout.minimumLineSpacing = space
        /// Item Atributtion
        layout.itemSize = CGSize(width: cellWidthConstant, height: cellHeightConstant)
        return layout
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
