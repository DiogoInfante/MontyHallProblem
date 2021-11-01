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
        self.backgroundColor = .clear
        self.collectionViewLayout = generateLayout()
        self.register(DoorCollectionViewCell.self, forCellWithReuseIdentifier: DoorCollectionViewCell.identifier)
    }
    /// Generates a door collection view layout
    /// - Returns: UICollectionViewLayout - According to specifications
    func generateLayout() -> UICollectionViewLayout {
      /// 1 - Item Size
      let itemSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: .fractionalHeight(1.0))
      let fullItem = NSCollectionLayoutItem(layoutSize: itemSize)
      /// 2 - Group Size
      let groupSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: .fractionalWidth(2/3))
      let group = NSCollectionLayoutGroup.horizontal(
        layoutSize: groupSize,
        subitem: fullItem,
        count: 3)
      /// 3 - Collection Layout
      let section = NSCollectionLayoutSection(group: group)
      let layout = UICollectionViewCompositionalLayout(section: section)
      /// Layout
      self.isScrollEnabled = false
      return layout
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
