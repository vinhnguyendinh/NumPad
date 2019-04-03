//
//  GreenCallButtonCell.swift
//  PhonePadCollectionView
//
//  Created by Nguyen Vinh on 4/3/19.
//  Copyright © 2019 Nguyen Vinh. All rights reserved.
//

import UIKit

class GreenCallButtonCell: UICollectionViewCell {
    // MARK: - UI Property
    
    // MARK: - Property
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.layer.cornerRadius = self.contentView.frame.width / 2
        self.contentView.layer.masksToBounds = true
    }
    
    // MARK: - Config
    fileprivate func setupView() {
        self.contentView.backgroundColor = #colorLiteral(red: 0.2981771827, green: 0.8499489427, blue: 0.394482553, alpha: 1)
    }
    
    // MARK: - UI Action
    
    // MARK: - Handler
    
    // MARK: - Override Function
    
    // MARK: - Notifications
    
    // MARK: - Utils
}
