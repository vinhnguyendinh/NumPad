//
//  SpaceCell.swift
//  PhonePadCollectionView
//
//  Created by Nguyen Vinh on 4/3/19.
//  Copyright © 2019 Nguyen Vinh. All rights reserved.
//

import UIKit

class SpaceCell: UICollectionViewCell {
    // MARK: - UI Property
    
    // MARK: - Property
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.layer.cornerRadius = self.contentView.frame.width / 2
        self.contentView.layer.masksToBounds = true
    }
    
    // MARK: - Config
    
    // MARK: - UI Action
    
    // MARK: - Handler
    
    // MARK: - Override Function
    
    // MARK: - Notifications
    
    // MARK: - Utils
}
